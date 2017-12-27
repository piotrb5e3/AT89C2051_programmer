from intelhex import IntelHex
import argparse

from at89overlord.at89comm import AT89comm


def write_hex(comm, filename):
    ih = IntelHex(filename)
    dt = [ih[i] for i in range(0x00, 0x800)]  # AT89C2051 has only 2K of on-chip flash
    comm.do_write(dt)


def main():
    parser = argparse.ArgumentParser(description='Uploader for Arduino based AT89C2051 programmer')
    parser.add_argument('-p', '--port', dest='port', metavar='PORT', default='/dev/ttyACM0', help='serial port with arduino connected to it')
    parser.add_argument('-b', '--baud', dest='baud', metavar='BAUD', type=int, default=9600, help='baud rate of connected arduino')
    parser.add_argument('-e', '--no-erase', dest='ne', action='store_true', help='Do not erase flash before write')
    g = parser.add_mutually_exclusive_group(required=True)
    g.add_argument('-f', '--file', dest='filename', metavar='FILE', nargs=1, help='intel hex file to be flashed onto the chip')
    g.add_argument('-r', '--read', dest='rd', action='store_true', help='Only read contents of chip flash')
    
    a = parser.parse_args()

    comm = AT89comm(port=a.port, baud=a.baud)
    # Initialize the programmer
    comm.begin()

    if a.rd:
        comm.do_read(0x800)  # AT89C2051 has only 2K of on-chip flash
        return

    if not a.ne:
        comm.do_erase()

    write_hex(comm, a.filename[0])
    