from intelhex import IntelHex
import argparse

from at89overlord.at89comm import AT89comm

AT89C2051_FLASH_SIZE = 0x800


def write_hex(comm, filename, verify):
    ih = IntelHex(filename)
    print('# Writing flash...')
    dt = [ih[i] for i in range(0x00, AT89C2051_FLASH_SIZE)]
    comm.do_write(dt)
    print('# Done!')
    if verify:
        print('# Verifying...')
        comm.do_verify(dt)
        print('# Done!')


def read_hex(comm, filename):
    print('# Reading chip flash...')
    data = comm.do_read(AT89C2051_FLASH_SIZE)  # AT89C2051 has only 2K of on-chip flash
    ih = IntelHex()
    for i in range(AT89C2051_FLASH_SIZE):
        ih[i] = data[i]
    ih.tofile(filename, format='hex')
    print('# Done!')


def main():
    parser = argparse.ArgumentParser(description='Uploader for Arduino based AT89C2051 programmer')
    parser.add_argument('-p', '--port', dest='port', metavar='PORT', default='/dev/ttyACM0', help='serial port with arduino connected to it')
    parser.add_argument('-b', '--baud', dest='baud', metavar='BAUD', type=int, default=9600, help='baud rate of connected arduino')
    parser.add_argument('-e', '--no-erase', dest='ne', action='store_true', help='do not erase flash before write')
    parser.add_argument('-c', '--no-confirm', dest='nc', action='store_true', help='do not confirm chip ID before executing an action')
    parser.add_argument('-V', '--no-verify', dest='nv', action='store_true', help='do not verify flash content after write')
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='more verbose output')
    g = parser.add_mutually_exclusive_group(required=True)
    g.add_argument('-f', '--file', dest='filename', metavar='FILE', nargs=1, help='intel hex file to be flashed onto the chip')
    g.add_argument('-r', '--read', dest='dest_filename', metavar='FILE', nargs=1, help='read flash content from chip and write to intel hex file')

    a = parser.parse_args()

    comm = AT89comm(port=a.port, baud=a.baud, verbose=a.verbose)
    # Initialize the programmer
    print('# Initializing the programmer...')
    comm.begin()
    print('# Initialized!')

    if not a.nc:
        print('# Confirming chip ID...')
        comm.do_confirm_signature()
        print('# Confirmed!')

    if a.dest_filename is not None and len(a.dest_filename) > 0:
        read_hex(comm=comm, filename=a.dest_filename[0])
        return

    if a.filename is not None and len(a.filename) > 0:
        if not a.ne:
            print('# Erasing flash...')
            comm.do_erase()
            print('# Done!')
        write_hex(comm=comm, filename=a.filename[0], verify=(not a.nv))
        return

    print('# Neither read nor write ordered. This is unexpected!')
