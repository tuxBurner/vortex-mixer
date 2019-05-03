EESchema Schematic File Version 4
LIBS:vortex-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Vortex Mixer Motorcontroller"
Date ""
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Screw_Terminal_01x02 VIn1
U 1 1 5C3B5D9D
P 4350 1900
F 0 "VIn1" H 4270 1575 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4270 1666 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4350 1900 50  0001 C CNN
F 3 "~" H 4350 1900 50  0001 C CNN
	1    4350 1900
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 Motor1
U 1 1 5C3B5E36
P 7200 1800
F 0 "Motor1" H 7280 1792 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 7280 1701 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 7200 1800 50  0001 C CNN
F 3 "~" H 7200 1800 50  0001 C CNN
	1    7200 1800
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM317_3PinPackage Regulator1
U 1 1 5C3B5F2E
P 5900 1450
F 0 "Regulator1" H 5900 1692 50  0000 C CNN
F 1 "LM317_3PinPackage" H 5900 1601 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5900 1700 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 5900 1450 50  0001 C CNN
	1    5900 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV10k1
U 1 1 5C3B6069
P 5900 2150
F 0 "RV10k1" H 5830 2196 50  0000 R CNN
F 1 "R_POT" H 5830 2105 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK163_Single_Horizontal" H 5900 2150 50  0001 C CNN
F 3 "~" H 5900 2150 50  0001 C CNN
	1    5900 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1K1
U 1 1 5C3B614E
P 6400 1800
F 0 "R1K1" H 6470 1846 50  0000 L CNN
F 1 "R" H 6470 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6330 1800 50  0001 C CNN
F 3 "~" H 6400 1800 50  0001 C CNN
	1    6400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1450 6400 1450
Wire Wire Line
	6400 1450 6400 1650
Wire Wire Line
	5900 2000 6400 2000
Wire Wire Line
	6400 2000 6400 1950
Wire Wire Line
	5900 2000 5900 1750
Connection ~ 5900 2000
$Comp
L power:GND #PWR0101
U 1 1 5C3B61ED
P 6050 2150
F 0 "#PWR0101" H 6050 1900 50  0001 C CNN
F 1 "GND" V 6055 2022 50  0000 R CNN
F 2 "" H 6050 2150 50  0001 C CNN
F 3 "" H 6050 2150 50  0001 C CNN
	1    6050 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5C3B622D
P 7000 1900
F 0 "#PWR0102" H 7000 1650 50  0001 C CNN
F 1 "GND" V 7005 1772 50  0000 R CNN
F 2 "" H 7000 1900 50  0001 C CNN
F 3 "" H 7000 1900 50  0001 C CNN
	1    7000 1900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C3B6268
P 4550 1900
F 0 "#PWR0103" H 4550 1650 50  0001 C CNN
F 1 "GND" V 4555 1772 50  0000 R CNN
F 2 "" H 4550 1900 50  0001 C CNN
F 3 "" H 4550 1900 50  0001 C CNN
	1    4550 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 1450 5050 1450
Wire Wire Line
	4750 1450 4750 1800
Wire Wire Line
	4750 1800 4550 1800
Wire Wire Line
	6400 1450 6600 1450
Wire Wire Line
	6800 1450 6800 1800
Wire Wire Line
	6800 1800 7000 1800
Connection ~ 6400 1450
$Comp
L Device:CP_Small C47uF20V1
U 1 1 5C3B64ED
P 5050 1550
F 0 "C47uF20V1" H 5138 1596 50  0000 L CNN
F 1 "CP_Small" H 5138 1505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5050 1550 50  0001 C CNN
F 3 "~" H 5050 1550 50  0001 C CNN
	1    5050 1550
	1    0    0    -1  
$EndComp
Connection ~ 5050 1450
Wire Wire Line
	5050 1450 4750 1450
$Comp
L power:GND #PWR0104
U 1 1 5C3B6571
P 5050 1650
F 0 "#PWR0104" H 5050 1400 50  0001 C CNN
F 1 "GND" H 5055 1477 50  0000 C CNN
F 2 "" H 5050 1650 50  0001 C CNN
F 3 "" H 5050 1650 50  0001 C CNN
	1    5050 1650
	1    0    0    -1  
$EndComp
NoConn ~ 5900 2300
Text Label 6600 1450 0    50   ~ 0
Motor+
Text Label 4750 1450 0    50   ~ 0
VIn
$Comp
L pspice:DIODE D1n4007
U 1 1 5C3B90F1
P 5900 900
F 0 "D1n4007" H 5900 635 50  0000 C CNN
F 1 "DIODE" H 5900 726 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 5900 900 50  0001 C CNN
F 3 "~" H 5900 900 50  0001 C CNN
	1    5900 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 900  5050 900 
Wire Wire Line
	5050 900  5050 1450
Wire Wire Line
	6100 900  6400 900 
Wire Wire Line
	6400 900  6400 1450
$Comp
L Device:CP_Small C47uF20V2
U 1 1 5C5A98A9
P 6600 1550
F 0 "C47uF20V2" H 6688 1596 50  0000 L CNN
F 1 "CP_Small" H 6688 1505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6600 1550 50  0001 C CNN
F 3 "~" H 6600 1550 50  0001 C CNN
	1    6600 1550
	1    0    0    -1  
$EndComp
Connection ~ 6600 1450
Wire Wire Line
	6600 1450 6800 1450
$Comp
L power:GND #PWR0105
U 1 1 5C5A9931
P 6600 1650
F 0 "#PWR0105" H 6600 1400 50  0001 C CNN
F 1 "GND" H 6605 1477 50  0000 C CNN
F 2 "" H 6600 1650 50  0001 C CNN
F 3 "" H 6600 1650 50  0001 C CNN
	1    6600 1650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
