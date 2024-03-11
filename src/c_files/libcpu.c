#include "../h_files/libcpu.h"
#include <stdio.h>

void gen_control_signals(RiscV* cpu,uint8_t opcode){

	switch(opcode){
		case 0x33: //R type instr
			cpu->ALUSrc = 0;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			cpu->branch = 0;
			cpu->ALUOp[0] = 1;
			cpu->ALUOp[1] = 0;
			break;
		case 0x63: //B type instr
			cpu->ALUSrc = 0;
			cpu->regWrite = 0;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			cpu->branch = 1;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 1;
			break;
		case 0x23: //S type instr
			cpu->ALUSrc = 1;
			cpu->regWrite = 0;
			cpu->memRead = 0;
			cpu->memWrite= 1;
			cpu->branch = 0;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 0;
			break;
		default:
			printf("icici\n");
			break;
	}
}

void init_registers(RiscV* cpu){
	cpu->pc = 0;

	cpu->memWrite=0;
	cpu->ALUOp[0]=0;
	cpu->ALUOp[1]=0;
	cpu->ALUSrc=0;
	cpu->regWrite=0;
	cpu->branch=0;
	cpu->memToReg=0;
	cpu->memRead=0;

	for(size_t i=0; i<NR_REGISTERS; i++){
		cpu->registers[i] = 0;
	}
}
