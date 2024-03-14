#include "../h_files/libcpu.h"
#include <stdint.h>
#include <stdio.h>

void gen_control_signals(RiscV* cpu,uint32_t instr){
	uint8_t opcode = instr & 0x0000007F; 

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
		case 0x03: // I instruction
			cpu->ALUSrc = 1;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			cpu->branch = 0;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 0;
			
			break;
		case 0x13: // ld instruction
			cpu->ALUSrc = 1;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 1;
			cpu->memWrite= 0;
			cpu->branch = 0;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 0;

			break;
		default:
			break;
	}
}

uint8_t gen_ALU_signal(RiscV* cpu,uint32_t instr){

	uint8_t funz3 = (instr >> 12) & 0x1F; 
	uint8_t funz7 = (instr >> 25) & 0x1F; 

	uint16_t code = ((funz7) << 3) + ((funz3) >> 3);

	uint8_t ALU_signal = 0;
	
	if(cpu->ALUOp[0] == 0 && cpu->ALUOp[1] == 0){
		ALU_signal = 0x2;
	}else if(cpu->ALUOp[1] == 1){
		ALU_signal = 0x6;
	}else if(cpu->ALUOp[0] == 1){

		switch(code){
			case 0:
				ALU_signal = 0x2;
				break;
			case 0x100:
				ALU_signal = 0x6;
				break;
			case 0x6:
				ALU_signal = 0x1;
				break;
			case 0x7:
				ALU_signal = 0x0;
				break;
		}

	}

	return ALU_signal;
}

uint64_t get_first_operand(RiscV* cpu,uint32_t instr){
	return ((instr>>15) & 0xF);
}

uint64_t get_second_operand(RiscV* cpu,uint32_t instr){
	uint64_t add=0;

	if(!(cpu->ALUSrc)){
		uint32_t reg_id = (instr >> 20) & 0xF; 
		add = cpu->registers[reg_id];
	}else{
	}

	return add;
}

void sum(RiscV* cpu,uint64_t r1,uint64_t r2,uint8_t ALU_code,uint32_t instr){
	uint64_t result = 0;

	switch(ALU_code){
		case 0x2:
			result = r1 + r2;
			break;
		case 0x6:
			result = r1 - r2;
			break;
		case 0x1:
			result = r1 | r2;
			break;
		case 0x0:
			result = r1 & r2;
			break;
	}


	if(cpu->regWrite){
		uint32_t rd = (instr>>7)&0xF;
		cpu->registers[rd] = result;
	}else if(cpu->memWrite){

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
