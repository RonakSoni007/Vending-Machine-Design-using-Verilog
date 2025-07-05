# Vending-Machine-Design-using-Verilog

This project implements a **finite state machine (FSM)-based vending machine** using **Verilog HDL**, designed to accept `$5` and `$10` coins and dispense a product worth `$15` with accurate change and reset capabilities.

## Features

- **FSM-based architecture** with three defined states:
  - `s0`: $0 inserted  
  - `s1`: $5 inserted  
  - `s2`: $10 inserted  
- **Accepts coin inputs**:
  - `2'b01`: $5  
  - `2'b10`: $10  
- **Product dispensing logic**:
  - Dispenses product once total value reaches or exceeds $15  
- **Change return system**:
  - Automatically returns `$5` or `$10` if excess amount is inserted  
- **Reset support**:
  - Resets the system to initial state on `rst` signal  
- **Output signals**:
  - `out`: Indicates product delivery  
  - `change`: Represents returned change (`2'b01` = $5, `2'b10` = $10)  

## Testbench included to simulate all functional cases:

- Multiple coin insertion sequences  
- Product dispensing at correct value  
- Accurate change return  
- System reset during operation  
