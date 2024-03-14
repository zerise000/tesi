# Thesis project
## Abstract

This is my personal project for braceholder degree thesis in Computer Science Engineering at [University of Trento](https://www.unitn.it/en).
It consists in an emulation environment of RISC-V CPU architecture, and it will be possible to execute it on FPGA embedded 
systems, and also it will support multi core emulation on many FPGA schedules at the same time.

## At what point the project is

For the moment I've implemented a partial decodification of RV32I instruction set (see [here](https://riscv.org/technical/specifications/) for more details). The program is not able to save results of ALU operations into registers or memory yet, but there should be no problem on executing them;it is also possible to retrieve operations from memory, even though there's no division between memory areas for the moment

## What will be implemented in the next commit

Surely a complete resolution of lacks illustrated in the previous paragraph will be filled. Also if circustamces permits me to do it, I will try to implement RV64I part of RISC-V ISA (again, see the link above)
