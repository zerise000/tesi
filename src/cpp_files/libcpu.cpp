#include "../h_files/libcpu.h"
#include "../h_files/libmem.h"
#include <cstddef>
#include <stdint.h>

typedef long long int int64;

void run_cpu(hls::stream<uint32_t>&program_in){
	Arch cpu;
	Memory mem;

	/*uint8_t funct3;
	uint8_t funct7;
	uint8_t opcode;*/

	while(1){
		init_registers(&cpu);
		init_mem(&mem);

		while(program_in.empty()){}

		while(!program_in.empty()){
			mem.instr_in.write(program_in.read());
		}


		load_program(&mem);


		while(1){
#pragma HLS PIPELINE
			mem.addr_in.write(cpu.pc);
			fetch(&mem,cpu.instr_in);

			cpu.instr = cpu.instr_in.read();

			/*funct3 = (cpu.instr >> 12)&0x3;
			funct7 = (cpu.instr >> 25) & 0x7F;
			opcode = cpu.instr & 0x7F;*/

			if(cpu.instr == 0x00){
				break;
			}

			def_immediate(&cpu);

			gen_control_signals(&cpu);
			check_branch_type(&cpu);
			gen_ALU_signal(&cpu);

			sum(&cpu);
			handle_result(&cpu,&mem);
			next_instr(&cpu);

			cpu.pc = cpu.next_instr.read();
		}
	}
}

void check_branch_type(Arch* cpu){
	uint8_t opcode = cpu->branch_op.read();
	uint8_t funct3 = (cpu->instr >> 12) & 0x3;

  	cpu->branch = 0;

	if(opcode == 0x63){
		cpu->branch = 1;
		cpu->branch_op.write(funct3);
	}

}

void next_instr(Arch* cpu){
	int64 incr = 4;
	uint64_t sub_res = cpu->ALU_result.read();
	int int_sub = (int)sub_res;
	int64 pc = (int64)cpu->pc;

	if(cpu->branch){
		switch(cpu->branch_op.read()){
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

	incr = (int64)incr;
	cpu->next_instr.write(pc+incr);
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

			break;
		case 0x63: //B type cpu->instr
			cpu->ALUSrc = 0;
			cpu->regWrite = 0;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			

			break;
		case 0x23: //S type cpu->instr
			cpu->ALUSrc = 1;
			cpu->regWrite = 0;
			cpu->memRead = 0;
			cpu->memWrite= 1;

			break;
		case 0x13: // I cpu->instruction
			cpu->ALUSrc = 1;
			cpu->memToReg = 0;
			cpu->regWrite = 1;
			cpu->memRead = 0;
			cpu->memWrite= 0;
			

			break;
		case 0x03: // ld cpu->instruction
			cpu->ALUSrc = 1;
			cpu->memToReg = 1;
			cpu->regWrite = 1;
			cpu->memRead = 1;
			cpu->memWrite= 0;
			cpu->branch = 0;


			break;
		default:
			break;
	}

	cpu->branch_op.write(opcode);
}

void gen_ALU_signal(Arch* cpu){

	uint8_t opcode = (cpu->instr & 0x7F);
	uint8_t funz3 = (cpu->instr >> 12) & 0x7;
	uint8_t funz7 = (cpu->instr >> 25) & 0x7F;

	uint16_t code = (funz7 << 3) + funz3;

	uint8_t signal = 0;
	
	if(opcode == 0x23 || opcode == 0x3){ // load or store instruction
		signal = 0x0;
	}else if(opcode == 0x63){ //branch instruction
		signal = 0x2;
	}else if(opcode == 0x33 || opcode == 0x13){ //R or I type instruction
		signal = funz3;

		switch(code){
			case 0x100:
				signal = 0x2;
				break;
			case 0x105:
				signal = 0x3;
		}

	}

	cpu->ALU_signal.write(signal);
}

uint64_t get_first_operand(Arch* cpu){
	uint8_t rd = ((cpu->instr>>15) & 0x1F);
	return cpu->registers[rd];
}

uint64_t get_second_operand(Arch* cpu){
	uint64_t res;

	if(cpu->ALUSrc){
		res = cpu->immediate;
	}else{
		uint8_t rd = (cpu->instr >> 20) & 0x1F;
		res = cpu->registers[rd];
	}


	return res; 
}

void def_immediate(Arch* cpu){
	uint8_t opcode = cpu->instr & 0x7F;
	uint8_t func3 = (cpu->instr >> 12) & 0x7;

	uint32_t first_range=0;
	uint32_t first_bit=0;

	uint32_t second_range=0;
	uint32_t last_bit=0;

	uint16_t first_part=0;
	uint16_t second_part=0;
	uint16_t imm_field=0;


	switch(opcode){
		case 0x3:
		case 0x13:
			cpu->immediate = (cpu->instr >> 20) & 0xEFF;

			// shift operations, need to extract the field shamt (see RISC-V ISA for more details)
			if(func3 == 0x1 || func3 == 0x5){
				cpu->immediate &= 0x1F;
			}
		  	break;
		case 0x63:

			cpu->immediate = ((cpu->instr & 0x80000000) >> 19) | ((cpu->instr & 0x80) >> 4) | ((cpu->instr >> 20) & 0x7E0) | ((cpu->instr >> 7) & 0x1E);

		  	break;

		case 0x23:

		  	cpu->immediate = ((cpu->instr >> 7) & 0x1F) | ((cpu->instr >> 25) & 0x3F);
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

	if((cpu->immediate >> 12 & 0x1)){
		cpu->immediate |= 0xFFFFF800;
	}

}

void handle_result(Arch* cpu,Memory* mem){

	uint32_t rd = (cpu->instr>>7)&0x1F;
	uint64_t result = cpu->ALU_result.read();

	if(cpu->regWrite){ //save the result into destination register
	  cpu->registers[rd] = result;
	}

	if(cpu->memWrite){ // surely it is a S instruction, so save reg content in data memory
	  uint8_t rs2 = (cpu->instr>>20) & 0x1F;
	  mem->data_buff[result] = cpu->registers[rs2];
	}

	if(cpu->memToReg){ //load instruction, copy value from memory to destination register
	  cpu->registers[rd] = mem->data_buff[result];	
	}

	cpu->ALU_result.write(result);
}

void sum(Arch* cpu){

	uint8_t ALU_code = cpu->ALU_signal.read();
	uint64_t op1 = get_first_operand(cpu);
	uint64_t op2 = get_second_operand(cpu);

	uint64_t result = 0;


	switch(ALU_code){
		case 0x0:
			result = op1 + op2;
			break;
		case 0x2:
			result = op1 - op2;
			break;
		case 0x4:
			result = op1 ^ op2;
			break;
		case 0x6:
			result = op1 | op2;
			break;
		case 0x7:
			result = op1 & op2;
			break;
		case 0x3:
			//bool mask = ((op1 >> 63) & 1);

			result = (op1 >> op2);
			break;
		case 0x5:
			result = op1 >> op2;
			break;
		case 0x1:
			result = op1 << op2;
			break;
	}


	cpu->ALU_result.write(result);
}

void init_registers(Arch* cpu){
	cpu->pc = 0;

	cpu->memWrite=0;

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
