# Sequential XOR Cipher in SystemVerilog

## About the Project

This repository contains my implementation for a practical assignment for the **Introduction to Logic Systems** (ISL) course at UFMG. The challenge was to create a sequential XOR cipher system using a hardware description language.

The goal is to process a text input (`plaintext`) and apply an 8-bit key using the XOR operation. The process is controlled bit-by-bit by a **Finite State Machine (FSM)**. The project was developed in **SystemVerilog**, resulting in clean and organized code.

## Features

* **Main Module (`cipher.sv`):** Implements the cipher for 8-bit text with an 8-bit key. It completes the operation in 8 clock cycles.
* **Bonus Module (`cipher_bonus.sv`):** A parameterized version that supports text of size `N` (larger than the key). The logic reuses the 8-bit key cyclically to cover the entire text.

## Technologies Used

* **SystemVerilog**
* **HDL Simulator** (Icarus Verilog or similar)

## Project Structure

```
.
├── doc/
│   └── documentacao.pdf
├── rtl/
│   ├── cipher.sv
│   └── cipher_bonus.sv
├── tb/
│   ├── cipher_tb.sv
│   └── cipher_bonus_tb.sv
└── README.md

```

## How to Simulate

### Prerequisites

* A SystemVerilog simulator installed and configured on your machine.

### Simulation

The project includes testbenches (`tb/`) to validate each module.

1. **For the main module**, compile and simulate:
* `rtl/cipher.sv`
* `tb/cipher_tb.sv`


2. **For the bonus module**, compile and simulate:
* `rtl/cipher_bonus.sv`
* `tb/cipher_bonus_tb.sv`



You can check the expected waveforms in the `doc/documentacao.pdf` file.

## Author

**Marney Santos de Melo**

## License

This project is under the MIT license.

---
