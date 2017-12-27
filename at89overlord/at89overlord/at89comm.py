import serial as ps
import sys
from termcolor import colored

STATUS_OK = 'OK'
STATUS_ERR = 'ERR'
STATUS_INVALID = 'INV'

COMM_STATUS_OK = '$'
COMM_STATUS_ERR = '^'
COMM_COMMAND_ERASE = 'X'
COMM_COMMAND_READ = 'R'
COMM_COMMAND_WRITE = 'W'
COMM_COMMAND_READ_SIGNATURE = 'S'

CHIP_ID_HI_BYTE = 0x1E
CHIP_ID_LO_BYTE = 0x21


class AT89comm:
    serial = None
    status = STATUS_INVALID
    verbose = None

    def __init__(self, port, baud, verbose=False):
        self.serial = ps.Serial(port=port, baudrate=baud)
        self.verbose = verbose
        if verbose:
            print(('# Verbose mode is enabled. '
                   'Received data will be printed in {}'
                   ' and sent data in {}').format(
                       colored('yellow', 'yellow'), colored('blue', 'blue')))

    def begin(self):
        # Cleanup buffers and reset the Arduino
        self.serial.dtr = 0
        self.serial.dtr = 1
        self.serial.reset_input_buffer()
        self.serial.reset_output_buffer()
        self.wait_end()
        self.status = STATUS_OK

    def wait_end(self):
        c = self._read()
        while c != COMM_STATUS_OK and c != COMM_STATUS_ERR:
            c = self._read()
        if c == COMM_STATUS_OK:
            return True
        else:
            self.status = STATUS_ERR
            raise AT89CommException('Programmer error')

    def do_erase(self):
        self.require_status_ok()
        self._write(COMM_COMMAND_ERASE)
        self.wait_end()

    def do_read(self, count):
        self.require_status_ok()
        self._write(COMM_COMMAND_READ)
        # hex, 4 digits, fill with leading 0s
        self._write('{:04X}'.format(count))
        self.wait_end()
        data = [self._read_byte() for i in range(count)]
        self.wait_end()
        return data

    def do_write(self, data):
        self.require_status_ok()
        chunksize = 256
        self._write(COMM_COMMAND_WRITE)
        # hex, 4 digits, fill with leading 0s
        self._write('{:04X}'.format(len(data)))
        self.wait_end()
        while len(data) > 0:
            v = data[:chunksize]
            data = data[chunksize:]
            for byte in v:
                self._write('{:02X}'.format(byte))
            self.wait_end()
        self.wait_end()

    def do_verify(self, data):
        self.require_status_ok()
        read_data = self.do_read(len(data))
        for i in range(len(data)):
            if data[i] != read_data[i]:
                errmsg = 'Verification error. Mismatch at byte 0x{:X}'
                errmsg = errmsg.format(i)
                raise AT89CommException(errmsg)

    def do_confirm_signature(self):
        self.require_status_ok()
        self._write(COMM_COMMAND_READ_SIGNATURE)
        hi = self._read_byte()
        lo = self._read_byte()
        self.wait_end()
        if hi != CHIP_ID_HI_BYTE or lo != CHIP_ID_LO_BYTE:
            errmsg = ('Incorrect chip signature. '
                      'Expected: {:02X},{:02X} Got: {:02X},{:02X}')
            errmsg = errmsg.format(CHIP_ID_HI_BYTE, CHIP_ID_LO_BYTE, hi, lo)
            raise AT89CommException(errmsg)

    def require_status_ok(self):
        if not self.is_status_ok():
            raise AT89CommException('Programmer in invalid state {}'.format(
                self.status))

    def is_status_ok(self):
        return self.status == STATUS_OK

    def _write(self, data):
        self.require_status_ok()
        if self.verbose:
            sys.stdout.write(colored(data, 'blue'))
            sys.stdout.flush()
        self.serial.write(data.encode())

    def _read(self):
        c = self.serial.read()
        c = c.decode()
        if self.verbose:
            sys.stdout.write(colored(c, 'yellow'))
            sys.stdout.flush()
        return c

    def _read_byte(self):
        hex_str = self.serial.read(size=2).decode()
        if self.verbose:
            sys.stdout.write(colored(hex_str, 'yellow'))
            sys.stdout.flush()
        try:
            return int(hex_str, 16)
        except ValueError:
            raise AT89CommException(
                'Received string: {} is not a hex number'.format(hex_str))


class AT89CommException(Exception):
    pass
