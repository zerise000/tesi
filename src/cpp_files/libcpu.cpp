#include "../h_files/libcpu.h"
#include "../h_files/libmem.h"
#include <cstddef>
#include <stdint.h>

typedef long long int int64;


void run_cpu(){
	Arch cpu;
	Bus bus;

	uint8_t funct3;
	uint8_t funct7;
	uint8_t opcode;
	uint32_t instr;
	uint64_t immediate;


	bus.instr_in.write(0x00318193);
	bus.instr_in.write(0x003000A3);
	bus.instr_in.write(0x00100383);

	init_mem(&bus);


	uint16_t load_pc=0;
	while(!bus.instr_in.empty()){
		bus.addr_write_in.write(load_pc);
		bus.data_in.write(bus.instr_in.read());
		bus.data_write_dim.write(32);
		load_pc+=4;
	}


	/*rst_mem();
	init_write(bus.addr_write_in,bus.data_in,bus.data_write_dim);
	init_read(bus.addr_read_in,bus.data_read_dim,bus.data_out);*/


	while(1){
		init_registers(&cpu);


		while(1){
#pragma HLS DATAFLOW
			//fetch
			bus.addr_read_in.write(cpu.pc);
			bus.data_read_dim.write(32);
			instr = bus.data_out.read();

			funct3 = (instr >> 12)&0x3;
			funct7 = (instr >> 25) & 0x7F;
			opcode = instr & 0x7F;

			if(instr == 0x00){
				break;
			}

			def_immediate(instr,opcode,funct3,&immediate);
			gen_control_signals(&cpu,opcode);

			check_branch_type(cpu.branch_op.read(),funct3,&cpu.branch,cpu.branch_op);
			gen_ALU_signal(opcode,funct3,funct7,cpu.ALU_signal);

			sum(&cpu,instr,opcode,immediate);
			handle_result(&cpu,&bus,instr);
			next_instr(&cpu,immediate);

			cpu.pc = cpu.next_instr.read();
		}
	}
}


void run_exception(Arch* cpu,Exception exc_type){
	uint16_t exception_pc = cpu->pc;
	uint64_t mstatus = cpu->csr_registers[MSTATUS];
	uint64_t sstatus = cpu->csr_registers[SSTATUS];
	Exec_mode prev_mode = cpu->curr_mode;


	if(cpu->curr_mode == S){
		cpu->curr_mode = S;
		cpu->pc = cpu->csr_registers[STVEC] & !1;
		cpu->csr_registers[SEPC] = exception_pc & !1;
		cpu->csr_registers[SCAUSE] = exc_type;
		cpu->csr_registers[STVAL] = 0;

		if((sstatus >> 1) & 1 == 1)
			sstatus |= (1 << 5);
		else
			sstatus &= !(1 <<5);

		cpu->csr_registers[SSTATUS] = sstatus & 0b01;
		if(prev_mode == U)
			cpu->csr_registers[SSTATUS] &= !(1<<8);
		else
			cpu->csr_registers[SSTATUS] &= !(1<<8);

	}else{
		/*
		- mtvec, Machine Trap Vector, holds the address the processor jumps to when an exception occurs.
		• mepc, Machine Exception PC, points to the instruction where the exception occurred.
		• mcause, Machine Exception Cause, indicates which exception occurred.
		• mie, Machine Interrupt Enable, lists which interrupts the processor can take and which
		it must ignore.
		• mip, Machine Interrupt Pending, lists the interrupts currently pending.
		- mtval, Machine Trap Value, holds additional trap information: the faulting address for
		  address exceptions, the instruction itself for illegal instruction exceptions, and zero for
		  other exceptions.
		• mscratch, Machine Scratch, holds one word of data for temporary storage.
		• mstatus, Machine Status, holds the global interrupt enable, along with a plethora of
	      other state
		 */

		cpu->curr_mode = M;
		cpu->pc = cpu->csr_registers[MTVEC] & !1;
		cpu->csr_registers[MEPC] = exception_pc & !1;
		cpu->csr_registers[MCAUSE] = exc_type;
		cpu->csr_registers[MTVAL] = 0;

		if((mstatus >> 3) & 1 == 1) //mie
			mstatus |= (1 << 7);
		else
			mstatus &= !(1 << 7);

		cpu->csr_registers[MSTATUS] = mstatus & 0x7 & !(0b11 << 11);

	}


}

void check_branch_type(uint8_t opcode,uint8_t funct3,bool* branch,hls::stream<uint8_t> &branch_op){
  	*branch = 0;

	if(opcode == 0x63){
		*branch = 1;
		branch_op.write(funct3);
	}
}

void next_instr(Arch* cpu,uint64_t immediate){
	int64 incr = 4;
	uint64_t sub_res = cpu->ALU_result.read();
	int int_sub = (int)sub_res;
	int64 pc = (int64)cpu->pc;

	if(cpu->branch){
		switch(cpu->branch_op.read()){
			case 0x0:
				if(sub_res == 0)
					incr = immediate;
				break;
			case 0x1:
				if(sub_res != 0)
					incr = immediate;
				break;
			case 0x4:
				if(int_sub < 0) 
					incr = immediate;
				break;
			case 0x5:
				if(int_sub > 0) 
					incr = immediate;
				break;
		}
	}

	incr = (int64)incr;
	cpu->next_instr.write(pc+incr);
}

void gen_control_signals(Arch* cpu,uint8_t opcode){

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
			run_exception(cpu,ILLEGAL_INSTR);
			break;
	}

	cpu->branch_op.write(opcode);
}

void gen_ALU_signal(uint8_t opcode,uint8_t funct3,uint8_t funct7,hls::stream<uint8_t> &ALU_signal){

	uint16_t code = (funct7 << 3) + funct3;
	uint8_t signal = 0;
	
	if(opcode == 0x23 || opcode == 0x3){ // load or store instruction
		signal = 0x0;
	}else if(opcode == 0x63){ //branch instruction
		signal = 0x2;
	}else if(opcode == 0x33 || opcode == 0x13){ //R or I type instruction
		signal = funct3;

		switch(code){
			case 0x100:
				signal = 0x2;
				break;
			case 0x105:
				signal = 0x3;
		}

	}

	ALU_signal.write(signal);
}

uint64_t get_first_operand(Arch* cpu,uint8_t opcode,uint8_t rd,uint8_t s_rd){
	uint8_t sel_reg = rd;

	if(opcode == 0x23)
		sel_reg = s_rd;

	return cpu->registers[sel_reg];
}

uint64_t get_second_operand(Arch* cpu,uint8_t rd,uint64_t immediate){
	uint64_t res;

	if(cpu->ALUSrc){
		res = immediate;
	}else{
		res = cpu->registers[rd];
	}


	return res; 
}

void def_immediate(uint32_t instr,uint8_t opcode,uint8_t func3,uint64_t* immediate){
	uint32_t first_range=0;
	uint32_t first_bit=0;

	uint32_t second_range=0;
	uint32_t last_bit=0;

	uint16_t first_part=0;
	uint16_t second_part=0;
	uint16_t imm_field=0;

	uint64_t res;

	switch(opcode){
		case 0x3:
		case 0x13:
			res= (instr >> 20) & 0xEFF;

			// shift operations, need to extract the field shamt (see RISC-V ISA for more details)
			if(func3 == 0x1 || func3 == 0x5){
				res &= 0x1F;
			}
		  	break;
		case 0x63:

			res = ((instr & 0x80000000) >> 19) | ((instr & 0x80) >> 4) | ((instr >> 20) & 0x7E0) | ((instr >> 7) & 0x1E);

		  	break;

		case 0x23:

		  	res = ((instr >> 7) & 0x1F) | ((instr >> 25) & 0x3F);
		  	break;

		case 0x6F:
			imm_field = (instr >> 12);

		  	second_range = (imm_field & 0x7F) << 12;
		  	first_bit = imm_field & 0x80;


		  	second_range = (imm_field & (0x1FF000 >> 3)) << 12;
		  	last_bit = (imm_field & 0x7FFFF) << 20;

		  	res = first_range + second_range + first_bit + last_bit;

		  	break;
		default:
		  	res = 0;
		  	break;
	}

	if((res >> 12 & 0x1)){
		res |= 0xFFFFF800;
	}

	*immediate = res;

}

void handle_result(Arch* cpu,Bus* bus,uint32_t instr){

	uint32_t rd = (instr>>7)&0x1F;
	uint64_t result = cpu->ALU_result.read();
	uint8_t hr_funct3 = instr>>12 & 0x3;
	uint8_t ld_mask = 0x0;


	if(cpu->regWrite){ //save the result into destination register
	  cpu->registers[rd] = result;
	}

	if(cpu->memWrite){ // surely it is a S instruction, so save reg content in data memory
	  uint8_t rs2 = (instr>>20) & 0x1F;
	  /* if we check RISC-V ISA store instructions,
	    we notice that function 3 field is the base 2 logarithm of the
	    dimension size we want to store*/

	  bus->data_in.write(cpu->registers[rs2]);
	  bus->addr_write_in.write(MEM_MAP_DATA+result);
	  bus->data_write_dim.write(8<<hr_funct3);

	  //send_write_signal();
	  //while(wait_write_complete());
	}

	if(cpu->memToReg){ //load instruction, copy value from memory to destination register

		/* if we check RISC-V ISA store instructions,
		   we notice that function 3 field is the base 2 logarithm (plus 4) of the
		   dimension size we want to store*/

		if(hr_funct3>=0x4 && hr_funct3 <= 0x6)
			ld_mask = 0x4;


		bus->data_read_dim.write(8<<(hr_funct3-ld_mask));
		bus->addr_read_in.write(MEM_MAP_DATA+result);

		cpu->registers[rd] = bus->data_out.read();

	}

	cpu->ALU_result.write(result);
}

void sum(Arch* cpu,uint32_t instr,uint8_t opcode,uint64_t immediate){

	uint8_t rd = (instr>>20)&0x1F;
	uint8_t s_rd = (instr>>15)&0x1F;
	uint8_t ALU_code = cpu->ALU_signal.read();
	uint64_t op1 = get_first_operand(cpu,opcode,rd,s_rd);
	uint64_t op2 = get_second_operand(cpu,rd,immediate);

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
			//TODO: logical shift
			//bool mask = ((op1 >> 63) & 1);

			result = (op1 >> op2);
			break;
		case 0x5:
			result = op1 >> op2;
			break;
		case 0x1:
			result = op1 << op2;
			break;
		default:
			run_exception(cpu,ILLEGAL_INSTR);
	}


	cpu->ALU_result.write(result);
}

void init_registers(Arch* cpu){
	cpu->pc = 0;
	cpu->memWrite=0;

	cpu->ALUSrc=0;
	cpu->regWrite=0;
	cpu->branch=0;
	cpu->memToReg=0;
	cpu->memRead=0;

	cpu->curr_mode = U;

	for(size_t i=0; i<NR_REGISTERS; i++){
		cpu->registers[i] = 0;
	}

	for(size_t i=0; i<NR_CSR; i++){
			cpu->csr_registers[i] = 0;
		}
}
