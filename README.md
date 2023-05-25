# MIPS32 Project

This repository contains the implementation of a MIPS32 processor using Verilog HDL. The project includes various modules such as ALU, control unit, register file, memory, instruction memory, and more. It aims to provide a functional implementation of the MIPS32 architecture.

## Modules

The project consists of the following Verilog modules:

- `alucontrol.v`: Implements the ALU control logic.
- `aluunit.v`: Represents the Arithmetic Logic Unit (ALU) responsible for performing arithmetic and logical operations.
- `clock.v`: Defines a clock module for generating a clock signal.
- `controlunit.v`: Implements the control unit that generates control signals based on the opcode.
- `instructionmemory.v`: Represents the instruction memory module responsible for storing and retrieving instructions.
- `jumpregister.v`: Implements the jump register module that determines if the jump instruction should be executed.
- `memory.v`: Represents the memory module that handles read and write operations.
- `mux2to1.v`: Implements a 2-to-1 multiplexer.
- `mux4to1.v`: Implements a 4-to-1 multiplexer.
- `mux45bit.v`: Implements a 4-to-1 multiplexer with 5-bit inputs.
- `programmedcounter.v`: Represents the program counter module that manages the program flow.
- `registerfile.v`: Implements the register file module that stores and retrieves data.


## Usage

To use the MIPS32 processor implementation, follow these steps:

1. Ensure that you have a Verilog simulator installed (e.g., ModelSim, Xilinx ISE, etc.).
2. Clone or download this repository to your local machine.
3. Compile and simulate the desired module using the Verilog simulator of your choice.

## Acknowledgements
This project was inspired by the MIPS architecture and the need for educational purposes. Special thanks to the contributors who helped in developing and testing the modules.



