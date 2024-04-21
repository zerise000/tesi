#include "../h_files/libcpu.h"
#include "../h_files/libmem.h"
#include <cstddef>
#include <stdint.h>

static void check_branch_type(Arch* cpu,uint8_t opcode){
	uint8_t funct3 = (cpu->instr >> 12) & 0x3;

  	cpu->branch = 0;

	if(opcode == 0x63){
		cpu->branch = 1;
		cpu->branch_op = funct3;
	}

}

static void next_instr(Arch* cpu,uint64_t sub_res){
	uint64_t incr = 4;
	int int_sub = (int)sub_res;

	if(cpu->branch){
		switch(cpu->branch_op){
			case 0x0:
				if(sub_res == 0)
					incr = cpu->immediate;
				break;
			case 0x1:
				if(sub_res != 0)
					incr = cpu->immediate;
				break;
			case 0x4:
				if(int_sub < 0) 
					incr = cpu->immediate;
				break;
			case 0x5:
				if(int_sub > 0) 
					incr = cpu->immediate;
				break;
		}
	}

	cpu->pc += incr;
}

void gen_control_signals(Arch* cpu){
	uint8_t opcode = cpu->instr & 0x7F; 

	switch(opcode){
		case 0x33: //R type cpu->instr
			cpu->ALUSrc = 0;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			cpu->ALUOp[0] = 1;
			cpu->ALUOp[1] = 0;
			break;
		case 0x63: //B type cpu->instr
			cpu->ALUSrc = 0;
			cpu->regWrite = 0;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 1;
			
			break;
		case 0x23: //S type cpu->instr
			cpu->ALUSrc = 1;
			cpu->regWrite = 0;
			cpu->memRead = 0;
			cpu->memWrite= 1;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 0;
			break;
		case 0x03: // I cpu->instruction
			cpu->ALUSrc = 1;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 0;
			
			break;
		case 0x13: // ld cpu->instruction
			cpu->ALUSrc = 1;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 1;
			cpu->memWrite= 0;
			cpu->ALUOp[0] = 0;
			cpu->ALUOp[1] = 0;

			break;
		default:
			break;
	}

	check_branch_type(cpu,opcode);
}

void gen_ALU_signal(Arch* cpu){

	uint8_t funz3 = (cpu->instr >> 12) & 0x1F; 
	uint8_t funz7 = (cpu->instr >> 25) & 0x1F; 

	uint16_t code = ((funz7) << 3) + ((funz3) >> 3);

	uint8_t signal = 0;
	
	if(cpu->ALUOp[0] == 0 && cpu->ALUOp[1] == 0){
		signal = 0x2;
	}else if(cpu->ALUOp[1] == 1){
		signal = 0x6;
	}else if(cpu->ALUOp[0] == 1){

		switch(code){
			case 0:
				signal = 0x2;
				break;
			case 0x100:
				signal = 0x6;
				break;
			case 0x6:
				signal = 0x1;
				break;
			case 0x7:
				signal = 0x0;
				break;
		}

	}

	cpu->ALU_signal.write(signal);
}

uint64_t get_first_operand(Arch* cpu){
	return ((cpu->instr>>15) & 0x1F);
}

uint64_t get_second_operand(Arch* cpu){
	uint64_t res;

	if(cpu->ALUSrc){
		res = (cpu->instr >> 20) & 0x1F; 
	}else{
		res = cpu->immediate;
	}


	return res; 
}

void def_immediate(Arch* cpu){
	uint8_t opcode = cpu->instr & 0x7F;

	uint32_t first_range=0;
	uint32_t first_bit=0;

	uint32_t second_range=0;
	uint32_t last_bit=0;

	uint16_t first_part=0;
	uint16_t second_part=0;
	uint16_t imm_field=0;

	switch(opcode){
		case 0x3:
			cpu->immediate = (cpu->instr >> 20) & 0xEFF;
		  	break;
		case 0x63:
			first_part = (cpu->instr >> 7);
			second_part  = (cpu->instr >> 25);


		  	first_bit = (first_part & 0x1) << 11;
		  	last_bit = (second_part & 0x20) << 12;

		  	first_range = (first_part >> 1) & 0xF;
		  	second_range = (second_part & 0x3F) << 5;

		  	cpu->immediate = (first_range + second_range + first_bit + last_bit)<<1;
		  	break;

		case 0x23:

		  	cpu->immediate = ((cpu->instr >> 7) & 0x1F) + ((cpu->instr >> 25) & 0x3F);
		  	break;

		case 0x6F:
			imm_field = (cpu->instr >> 12);

		  	second_range = (imm_field & 0x7F) << 12;
		  	first_bit = imm_field & 0x80;


		  	second_range = (imm_field & (0x1FF000 >> 3)) << 12;
		  	last_bit = (imm_field & 0x7FFFF) << 20;

		  	cpu->immediate = first_range + second_range + first_bit + last_bit;

		  	break;
		default:
		  	cpu->immediate = 0;
		  	break;
	}

}

void handle_result(Arch* cpu,Memory* mem){

	uint32_t rd = (cpu->instr>>7)&0x1F;
	uint64_t result = cpu->ALU_result.read();

	if(cpu->regWrite){
	  cpu->registers[rd] = result;
	}

	if(cpu->memWrite){ // surely it is a S instruction
	  uint8_t rs2 = (cpu->instr>>20) & 0x1F;
	  mem->data_buff[result] = cpu->registers[rs2];
	}

	if(cpu->memToReg){
	  cpu->registers[rd] = mem->data_buff[result];	
	}

	next_instr(cpu,result);
}

void sum(Arch* cpu){

	uint8_t ALU_code = cpu->ALU_signal.read();
	uint64_t op1 = get_first_operand(cpu);
	uint64_t op2 = get_second_operand(cpu);

	uint64_t result = 0;

	switch(ALU_code){
		case 0x2:
			result = op1 + op2;
			break;
		case 0x6:
			result = op1 - op2;
			break;
		case 0x1:
			result = op1 | op2;
			break;
		case 0x0:
			result = op1 & op2;
			break;
	}


	cpu->ALU_result.write(result);
}

void init_registers(Arch* cpu){
	cpu->pc = 0;

	cpu->memWrite=0;

	cpu->ALUOp[0]=0;
	cpu->ALUOp[1]=0;

	cpu->branch_op=0;
	cpu->immediate = 0;

	cpu->ALUSrc=0;
	cpu->regWrite=0;
	cpu->branch=0;
	cpu->memToReg=0;
	cpu->memRead=0;

	for(size_t i=0; i<NR_REGISTERS; i++){
		cpu->registers[i] = 0;
	}
}
