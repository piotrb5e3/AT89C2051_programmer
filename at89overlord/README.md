# at89overlord
Uploader for Arduino based AT89C2051 programmer

# Usage
```
at89overlord [-h] [-p PORT] [-b BAUD] [-e] [-c] [-V] [-v] (-f FILE | -r FILE)
```

|        Argument         |                       Description                        |
|-------------------------|----------------------------------------------------------|
|  `-h, --help`           | show this help message and exit                          |
|  `-p PORT, --port PORT` | serial port with arduino connected to it                 |
|  `-b BAUD, --baud BAUD` | baud rate of connected arduino                           |
|  `-e, --no-erase`       | do not erase flash before write                          |
|  `-c, --no-confirm`     | do not confirm chip ID before executing an action        |
|  `-V, --no-verify`      | do not verify flash content after write                  |
|  `-v, --verbose`        | more verbose output                                      |
|  `-f FILE, --file FILE` | intel hex file to be flashed onto the chip               |
|  `-r FILE, --read FILE` | read flash content from chip and write to intel hex file |