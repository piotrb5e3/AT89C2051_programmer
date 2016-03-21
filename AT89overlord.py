#!/bin/python2
import serial as ps
import time as tm
import sys
from intelhex import IntelHex
import argparse

def wait_end(port):
    c = port.read()
    #'^' means error
    #'$' means all OK
    while(c != '$' and c!='^'):
        sys.stdout.write(c)
        c = port.read()
    if(c == '$'):
        return 1
    else:
        sys.stdout.write('ERR\n')
        return 0
       

def do_erase(port):
    port.write('E')
    if wait_end(port):
        sys.stdout.write('ERASE OK\n')

def do_read(port, count):
    port.write('R');
    port.write("%02X" % (count / 256))
    port.write("%02X" % (count % 256))
    if wait_end(port):
        sys.stdout.write('READ OK\n')


def do_write(port, data):
    chunksize = 256
    port.write('W');
    port.write("%02X" % (len(data)/256))
    port.write("%02X" % (len(data)%256))
    if wait_end(port):
        while(len(data) > 0):
            v = data[:chunksize]
            data = data[chunksize:]
            for i in v:
                port.write("%02X" % i)
            if not wait_end(port):
                break
            if len(data) == 0:
                sys.stdout.write('WRITE OK\n')
               

def write_hex(port, filename):
    ih = IntelHex(filename)
    dt = [ih[i] for i in xrange(0x00, 0x800)] #AT89C2051 has only 2K of on-chip flash
    do_write(port, dt)

def run_stuff():
    parser = argparse.ArgumentParser(description='Uploader for Arduino based AT89C2051 programmer')
    g = parser.add_mutually_exclusive_group(required=True)
    g.add_argument('-f', '--file', dest='filename', metavar='FILE', nargs=1, help='intel hex file to be flashed onto the chip')
    parser.add_argument('-p', '--port', dest='port',metavar='PORT', default='/dev/ardUNO0', help='serial port with arduino connected to it')
    parser.add_argument('-b', '--baud', dest='baud', metavar='BAUD', type=int, default=9600, help='baud rate of connected arduino')
    parser.add_argument('-e', '--no-erase', dest='nr', action='store_true', help='Do not erase flash before write')
    g.add_argument('-r', '--read', dest='rd', action='store_true', help='Only read contents of chip flash')
    a = parser.parse_args()


    #begin upload
    s = ps.Serial(a.port, a.baud)

    s.dtr = 0
    s.dtr = 1
    s.reset_input_buffer()
    s.reset_output_buffer()
    wait_end(s)

    if a.rd:
        do_read(s, 2048) #AT89C2051 has only 2K of on-chip flash
        return

    if not a.nr:
        do_erase(s)

    #write_hex(s, '/dane/programming/8051/hello8051/main.ihx')

    write_hex(s, a.filename[0])


#BEGIN HERE
run_stuff()
