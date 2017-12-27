# AT89C2051_programmer
Python & Arduino-based AT89C2051 programmer

## Software requirements
* Python3 with pip
* Arduino IDE

## Hardware requirements
* Aruino UNO board
* Optocoupler (strongly recommend MOSFET-pair output)
* 12V nominal power supply (actual voltage required ~13.5V)
* (recommended) ZIF socket
The schematic is included as `schematic/schematic.pdf`.

## Flashing the programmer
1. Open `AT89_prog/AT89_prog.ino` in Arduino IDE
2. Flash onto the Arduino board

## Installing the programmer software
1. (recommended) Create a python virtualenv
  1. `python3 -m venv venv`
  2. `. venv/bin/activate`
2. Install from PyPI `pip install at89overlord`

## Programming
1. Place chip in socket
2. Connect the Arduino board to the computer
3. Connect the 12V power supply
4. On the computer run `at89overlord -f PATH_TO_INTEL_HEX_FILE`

## Other functionality
Run `at89overlord -h` for the full list of commands and flags

## Upgrading from an older version
* Check for changes in the schematic
* Reflash the Arduino board
* Reinstall the programming software

## Running on Windows
It should be possible to use this programmer on Windows.
* Install cygwin with python3 and pip
* When running the `at89overlord` append `-p COMn` to the arguments list,
  where `n` is the number of Arduino board's serial port.

