import serial as ps
import sys

STATUS_OK = 'OK'
STATUS_ERR = 'ERR'
STATUS_INVALID = 'INV'

COMM_STATUS_OK = '$'
COMM_STATUS_ERR = '^'
COMM_COMMAND_ERASE = 'E'
COMM_COMMAND_READ = 'R'
COMM_COMMAND_WRITE = 'W'


class AT89comm:
    serial = None
    status = STATUS_INVALID

    def __init__(self, port, baud):
        self.serial = ps.Serial(port=port, baudrate=baud)

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
        while(c != COMM_STATUS_OK and c != COMM_STATUS_ERR):
            sys.stdout.write(c)
            c = self._read()
        if(c == COMM_STATUS_OK):
            return True
        else:
            self.status = STATUS_ERR
            sys.stdout.write('ERR\n')
            return False

    def do_erase(self):
        self._write(COMM_COMMAND_ERASE)
        if self.wait_end():
            sys.stdout.write('ERASE OK\n')

    def do_read(self, count):
        self._write(COMM_COMMAND_READ)
        # hex, 4 digits, fill with leading 0s
        self._write('{:04X}'.format(count))
        if self.wait_end():
            sys.stdout.write('READ OK\n')

    def do_write(self, data):
        chunksize = 256
        self._write(COMM_COMMAND_WRITE)
        # hex, 4 digits, fill with leading 0s
        self._write('{:04X}'.format(len(data)))
        if self.wait_end():
            while(len(data) > 0):
                v = data[:chunksize]
                data = data[chunksize:]
                for byte in v:
                    self._write('{:02X}'.format(byte))
                if not self.wait_end():
                    break
                if len(data) == 0:
                    sys.stdout.write('WRITE OK\n')

    def is_status_ok(self):
        return self.status == STATUS_OK

    def _write(self, data):
        self.serial.write(data.encode())

    def _read(self):
        c = self.serial.read()
        return c.decode()
