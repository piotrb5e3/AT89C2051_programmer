EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:schematic-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 9400 1600
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L CONN_01X08 P1
U 1 1 56D70129
P 9600 1950
F 0 "P1" H 9600 2400 50  0000 C CNN
F 1 "Power" V 9700 1950 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1950 20  0000 C CNN
F 3 "" H 9600 1950 50  0000 C CNN
	1    9600 1950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" H 9150 1590 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" H 9050 1490 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR03" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR04" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 56D70DD8
P 9600 2750
F 0 "P2" H 9600 3100 50  0000 C CNN
F 1 "Analog" V 9700 2750 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2800 20  0000 C CNN
F 3 "" H 9600 2750 50  0000 C CNN
	1    9600 2750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L CONN_01X08 P4
U 1 1 56D7164F
P 10000 2650
F 0 "P4" H 10000 3100 50  0000 C CNN
F 1 "Digital" V 10100 2650 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2600 20  0000 C CNN
F 3 "" H 10000 2650 50  0000 C CNN
	1    10000 2650
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2500 8900 2500
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	9400 3000 8900 3000
$Comp
L CONN_01X10 P3
U 1 1 56D721E0
P 10000 1650
F 0 "P3" H 10000 2200 50  0000 C CNN
F 1 "Digital" V 10100 1650 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1650 20  0000 C CNN
F 3 "" H 10000 1650 50  0000 C CNN
	1    10000 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1900 10550 1900
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10200 2800 10550 2800
Wire Wire Line
	10200 2700 10550 2700
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 3150
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	500  3450 11200 3450
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
$Comp
L AT89C2051-PU U2
U 1 1 5921A059
P 6200 1950
F 0 "U2" H 5250 2950 50  0000 C CNN
F 1 "AT89C2051-PU" H 6950 1050 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 6200 1950 50  0001 C CIN
F 3 "" H 6200 1950 50  0001 C CNN
	1    6200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2550 7550 2550
Wire Wire Line
	7350 2650 7550 2650
Wire Wire Line
	7550 1150 7350 1150
Wire Wire Line
	7350 1250 7550 1250
Wire Wire Line
	7550 1350 7350 1350
Wire Wire Line
	7350 1450 7550 1450
Wire Wire Line
	7550 1550 7350 1550
Wire Wire Line
	7350 1650 7550 1650
Wire Wire Line
	7550 1750 7350 1750
Wire Wire Line
	7350 1850 7550 1850
$Comp
L +5V #PWR05
U 1 1 5921B469
P 6200 800
F 0 "#PWR05" H 6200 650 50  0001 C CNN
F 1 "+5V" H 6200 940 50  0000 C CNN
F 2 "" H 6200 800 50  0000 C CNN
F 3 "" H 6200 800 50  0000 C CNN
	1    6200 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 850  6200 800 
$Comp
L GND #PWR06
U 1 1 5921B7A0
P 6200 3000
F 0 "#PWR06" H 6200 2750 50  0001 C CNN
F 1 "GND" H 6200 2850 50  0000 C CNN
F 2 "" H 6200 3000 50  0000 C CNN
F 3 "" H 6200 3000 50  0000 C CNN
	1    6200 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3000 6200 2950
NoConn ~ 7350 2050
NoConn ~ 7350 2150
NoConn ~ 5050 1450
Wire Wire Line
	4850 1750 5050 1750
Wire Wire Line
	7350 2450 7550 2450
Wire Wire Line
	7550 2350 7350 2350
Wire Wire Line
	7350 2250 7550 2250
Wire Wire Line
	4850 1150 5050 1150
$Comp
L TLP222A U1
U 1 1 5921C0B3
P 2050 1150
F 0 "U1" H 1850 1350 50  0000 L CNN
F 1 "TLP222A" H 2050 1350 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 1850 950 50  0001 L CIN
F 3 "" H 2000 1150 50  0001 L CNN
	1    2050 1150
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5921C1FC
P 1650 1400
F 0 "R1" V 1730 1400 50  0000 C CNN
F 1 "1K" V 1650 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 1580 1400 50  0001 C CNN
F 3 "" H 1650 1400 50  0001 C CNN
	1    1650 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5921C4CA
P 1650 1550
F 0 "#PWR07" H 1650 1300 50  0001 C CNN
F 1 "GND" H 1650 1400 50  0000 C CNN
F 2 "" H 1650 1550 50  0000 C CNN
F 3 "" H 1650 1550 50  0000 C CNN
	1    1650 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1250 1750 1250
Wire Wire Line
	1650 1050 1750 1050
$Comp
L +12V #PWR08
U 1 1 5921CA20
P 2450 950
F 0 "#PWR08" H 2450 800 50  0001 C CNN
F 1 "+12V" H 2450 1090 50  0000 C CNN
F 2 "" H 2450 950 50  0001 C CNN
F 3 "" H 2450 950 50  0001 C CNN
	1    2450 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1050 2450 1050
Wire Wire Line
	2450 1050 2450 950 
$Comp
L R R2
U 1 1 5921CCDF
P 2500 1250
F 0 "R2" V 2580 1250 50  0000 C CNN
F 1 "1K" V 2500 1250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2430 1250 50  0001 C CNN
F 3 "" H 2500 1250 50  0001 C CNN
	1    2500 1250
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR09
U 1 1 5921CE2E
P 2650 950
F 0 "#PWR09" H 2650 800 50  0001 C CNN
F 1 "+5V" H 2650 1090 50  0000 C CNN
F 2 "" H 2650 950 50  0001 C CNN
F 3 "" H 2650 950 50  0001 C CNN
	1    2650 950 
	1    0    0    -1  
$EndComp
$Comp
L D D1
U 1 1 5921CE5A
P 2650 1100
F 0 "D1" H 2650 1200 50  0000 C CNN
F 1 "D" H 2650 1000 50  0000 C CNN
F 2 "Diodes_SMD:D_MELF" H 2650 1100 50  0001 C CNN
F 3 "" H 2650 1100 50  0001 C CNN
	1    2650 1100
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5921CF72
P 2800 1250
F 0 "R3" V 2880 1250 50  0000 C CNN
F 1 "1K" V 2800 1250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2730 1250 50  0001 C CNN
F 3 "" H 2800 1250 50  0001 C CNN
	1    2800 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 1250 2350 1550
Wire Wire Line
	2950 1250 3000 1250
Wire Wire Line
	2350 1550 2450 1550
Text GLabel 8900 2500 0    60   Input ~ 0
A0
Text GLabel 8900 2600 0    60   Input ~ 0
A1
Text GLabel 8900 2700 0    60   Input ~ 0
A2
Text GLabel 8900 2800 0    60   Input ~ 0
A3
Text GLabel 8900 2900 0    60   Input ~ 0
A4
Text GLabel 8900 3000 0    60   Input ~ 0
A5
Text GLabel 10550 2800 2    60   Input ~ 0
2
Text GLabel 10550 2700 2    60   Input ~ 0
3(**)
Text GLabel 10550 2600 2    60   Input ~ 0
4
Text GLabel 10550 2500 2    60   Input ~ 0
5(**)
Text GLabel 10550 2400 2    60   Input ~ 0
6(**)
Text GLabel 10550 2300 2    60   Input ~ 0
7
Text GLabel 10550 2100 2    60   Input ~ 0
8
Text GLabel 10550 2000 2    60   Input ~ 0
9(**)
Text GLabel 10550 1900 2    60   Input ~ 0
10(**/SS)
Text GLabel 10550 1800 2    60   Input ~ 0
11(**/MOSI)
Text GLabel 7550 1150 2    60   Input ~ 0
4
Text GLabel 7550 1250 2    60   Input ~ 0
5(**)
Text GLabel 7550 1350 2    60   Input ~ 0
6(**)
Text GLabel 7550 1450 2    60   Input ~ 0
7
Text GLabel 7550 1550 2    60   Input ~ 0
8
Text GLabel 7550 1650 2    60   Input ~ 0
9(**)
Text GLabel 7550 1750 2    60   Input ~ 0
10(**/SS)
Text GLabel 7550 1850 2    60   Input ~ 0
11(**/MOSI)
Text GLabel 1650 1050 0    60   Input ~ 0
A1
Text GLabel 3000 1250 2    60   Input ~ 0
A0
Text GLabel 2450 1550 2    60   Input ~ 0
AT89_RST
Text GLabel 4850 1750 0    60   Input ~ 0
A2
Text GLabel 4850 1150 0    60   Input ~ 0
AT89_RST
Text GLabel 7550 2250 2    60   Input ~ 0
A3
Text GLabel 7550 2350 2    60   Input ~ 0
A4
Text GLabel 7550 2450 2    60   Input ~ 0
A5
Text GLabel 7550 2550 2    60   Input ~ 0
2
Text GLabel 7550 2650 2    60   Input ~ 0
3(**)
NoConn ~ 10200 1700
NoConn ~ 10200 1600
NoConn ~ 10200 1400
NoConn ~ 10200 1300
NoConn ~ 10200 1200
NoConn ~ 9400 1700
NoConn ~ 9400 2300
NoConn ~ 9400 1800
NoConn ~ 10200 2900
NoConn ~ 10200 3000
$Comp
L +12V #PWR010
U 1 1 59220E33
P 3200 2400
F 0 "#PWR010" H 3200 2250 50  0001 C CNN
F 1 "+12V" H 3200 2540 50  0000 C CNN
F 2 "" H 3200 2400 50  0001 C CNN
F 3 "" H 3200 2400 50  0001 C CNN
	1    3200 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 59220F51
P 3200 3000
F 0 "#PWR011" H 3200 2750 50  0001 C CNN
F 1 "GND" H 3200 2850 50  0000 C CNN
F 2 "" H 3200 3000 50  0001 C CNN
F 3 "" H 3200 3000 50  0001 C CNN
	1    3200 3000
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 59220F81
P 3200 2550
F 0 "D2" H 3200 2650 50  0000 C CNN
F 1 "LED" H 3200 2450 50  0000 C CNN
F 2 "LEDs:LED_0805" H 3200 2550 50  0001 C CNN
F 3 "" H 3200 2550 50  0001 C CNN
	1    3200 2550
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 592210C5
P 3200 2850
F 0 "R4" V 3280 2850 50  0000 C CNN
F 1 "3K3" V 3200 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3130 2850 50  0001 C CNN
F 3 "" H 3200 2850 50  0001 C CNN
	1    3200 2850
	1    0    0    -1  
$EndComp
Wire Notes Line
	4050 3450 4050 500 
Wire Notes Line
	4050 1950 500  1950
$Comp
L Screw_Terminal_1x02 J1
U 1 1 592228FB
P 1400 2700
F 0 "J1" H 1400 2950 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 1250 2700 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MPT-2.54mm_2pol" H 1400 2475 50  0001 C CNN
F 3 "" H 1375 2700 50  0001 C CNN
	1    1400 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 59222A1D
P 1600 2900
F 0 "#PWR012" H 1600 2650 50  0001 C CNN
F 1 "GND" H 1600 2750 50  0000 C CNN
F 2 "" H 1600 2900 50  0001 C CNN
F 3 "" H 1600 2900 50  0001 C CNN
	1    1600 2900
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR013
U 1 1 59222A53
P 1600 2500
F 0 "#PWR013" H 1600 2350 50  0001 C CNN
F 1 "+12V" H 1600 2640 50  0000 C CNN
F 2 "" H 1600 2500 50  0001 C CNN
F 3 "" H 1600 2500 50  0001 C CNN
	1    1600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2900 1600 2800
Wire Wire Line
	1600 2600 1600 2500
Wire Notes Line
	2400 1950 2400 3450
$EndSCHEMATC
