# Railway-Gate-Controller-FSM-Verilog
# 🚆 Automatic Railway Crossing Gate Controller using Verilog HDL

## Overview

This project implements an Automatic Railway Crossing Gate Controller using a Finite State Machine (FSM) in Verilog HDL. The design automatically controls the railway gate based on train detection signals and is verified through behavioral simulation in Xilinx Vivado.

---

## Features

- Finite State Machine (FSM) based controller
- Automatic gate opening and closing
- Red and Green signal indication
- Warning buzzer control
- Behavioral simulation using Vivado

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- RTL Design
- Behavioral Simulation

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | System Clock |
| reset | Active High Reset |
| sensor1 | Train Approaching Sensor |
| sensor2 | Train Leaving Sensor |

---

## Outputs

| Signal | Description |
|---------|-------------|
| gate | Railway Gate Control |
| red_led | Stop Signal |
| green_led | Go Signal |
| buzzer | Warning Alarm |

---

## FSM States

1. IDLE
2. CLOSE_GATE
3. TRAIN_PASSING
4. OPEN_GATE

---

## State Transition

IDLE
↓
CLOSE_GATE
↓
TRAIN_PASSING
↓
OPEN_GATE
↓
IDLE

---

## Simulation Results

The simulation verifies:

- Gate remains open when no train is detected.
- Gate closes when Sensor1 detects the train.
- Gate stays closed while the train is passing.
- Gate opens after Sensor2 detects that the train has left.

---

## Project Files

- railway_gate.v
- railway_gate_tb.v

---

## Future Improvements

- Gate closing delay using counters
- Multiple train detection
- Seven-segment display for state indication
- Servo/DC motor interface
- Real FPGA implementation

---

## Author

**Yammanuru Charan Kumar**

Electronics and Communication Engineering

GitHub:
https://github.com/Ycharankumar7

LinkedIn:
https://linkedin.com/in/ycharankumar
