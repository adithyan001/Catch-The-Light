# CATCH THE LIGHT

## 1. Introduction

Catch the Light is an FPGA-based interactive game developed using Verilog HDL and implemented on the Digilent Basys 3 board. The objective of the game is to test the player’s reaction time and attention by having them replicate random LED patterns on the FPGA using switches. The game features a simple yet engaging mechanic: LEDs on the FPGA board turn on and off in a random sequence, and the player must match the pattern by adjusting the corresponding switches.

The game operates under two conditions:

1. The player has 20 seconds to score as many points as possible.
2. The game automatically ends when the player reaches a maximum score of 50 points.

Each time the player successfully aligns the switches to match the LED pattern, they score a point. If the player reaches 50 points before the time limit, the game ends early, and the user wins. Otherwise, the game stops after 20 seconds, and the final score is displayed. The score is displayed on two seven-segment displays on the MSB (left) side, while the remaining time is shown on two seven-segment displays on the LSB (right) side. 

The game also includes a reset functionality, allowing the user to restart the game by pressing a reset button, which is the push button in the center. This reset feature reinitializes the score and timer, allowing the player to start over.

### Tools:

* FPGA Board : Digilent Basys 3
* Software : Xilinx Vivado
* Language : Verilog HDL

## 2. Implementation

### Block diagram

![block diagram](https://github.com/adithyan001/Catch-The-Light/blob/main/catch%20the%20light%20block%20diagram.jpg)

The game is implemented according to the block diagram shown above. The main blocks in the block diagram are as follows:

### 1. Slow clock 100 Hz
This module takes the 100 MHz system clock and generates a 100 Hz clock.

### 2. Slow clock 1 Hz
This module takes the 100 MHz system clock and generates a 1 Hz clock.

### 3. Timer
This module counts down from 20 seconds and provides a signal when the count reaches zero. The count resets back to 20 seconds when the reset signal is asserted.

### 4. Catch the light (controller)
This module is responsible for controlling the entire game. It randomly turns the LEDs on or off, checks whether the switches match the LED patterns, and increments the score if a match is found. It is implemented as a finite state machine (FSM), where, upon detecting a match, the state updates. In each state, the score is incremented, and a random LED is turned on or off.

### 5. Binary to BCD
This module converts the binary input to its corresponding BCD (Binary-Coded Decimal) value. It is implemented based on the Shift-Add-3 algorithm.

### 6. 2-bit counter
It is a 2-bit free-running up counter. The output count of this counter is used to select the BCD value to be displayed as well as the specific 7-segment display on which the value will be shown.

### 7. Decoder
The decoder is used to select the 7-segment display that is to be enabled based on the output from the counter. It asserts a low signal to the display that is to be enabled and a high signal to all others.

### 8. Mux
The multiplexer (Mux) selects the BCD value to be displayed on the 7-segment display based on the counter output.

### 9. 7-segment controller
This module generates control signals for displaying digits on the 7-segment display based on the input BCD value that is to be shown.

## 3. Results
A Verilog code was developed for the Catch the Light game. The code was synthesized, and a bitstream was generated, which was subsequently uploaded to the Basys 3 board. 

The following video demonstrates the gameplay and overall functionality of the project.

>>>>>video<<<<<<<

The game is functioning perfectly as planned, demonstrating the successful implementation of the design.
