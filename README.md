﻿# PS2Controller

# Description
The PS2 keyboard controller reads pressed keys and displays the corresponding characters on eight 7-segment displays. The last four symbols are shown, with control keys having special functions (e.g., Enter clears the display).

Users can interact with the controller via the reset button or by typing on the keyboard. Pressing the reset button resets the internal state of the components involved in reading the serial signal from the keyboard. Keyboard interaction includes printing new characters and clearing the display. An alphanumeric key press shifts existing symbols left, displaying the new symbol on the rightmost segment. Pressing Enter clears the display.

The PS/2 keyboard protocol transmits serial information between the peripheral device and the computer. It's simpler than modern protocols like USB, making device compatibility easier to achieve. The protocol features multiple communication states, but we focus on the Idle state where PS2_Clk and PS2_Ser are HIGH, allowing the keyboard to send data.

When the keyboard sends data, PS2_Clk goes LOW. The host reads data from PS2_Ser on the falling edge of PS2_Clk. A data packet includes:

Start Bit: Always 0.
Data Bits: 8 bits, least significant bit first.
Parity Bit: Odd parity.
Stop Bit: Always 1.
In total, a packet contains 11 bits. The PS2_Clk frequency ranges between 10 and 16.66 kHz.


![image](https://github.com/user-attachments/assets/d83a5f0c-3c5f-4e7f-9d53-c63d043bf951)
