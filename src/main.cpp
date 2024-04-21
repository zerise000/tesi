#include "h_files/libcpu.h"
#include "h_files/libmem.h"
#include <stdint.h>


int main(){
	Arch cpu;
	Memory mem;

	init_registers(&cpu);
	init_mem(&mem);


	cpu.registers[3] = 3;
	cpu.registers[4] = 4;

	mem.instr_buff[0] = 0x63;
	mem.instr_buff[1] = 0x94;
	mem.instr_buff[2] = 0x20;
	mem.instr_buff[3] = 0x00;



	mem.addr_in.write(cpu.pc);
	fetch(&mem,cpu.instr_in);

#pragma HLS PIPELINE
	cpu.instr = cpu.instr_in.read();
	def_immediate(&cpu);


	gen_control_signals(&cpu);
	gen_ALU_signal(&cpu);

#pragma HLS PIPELINE off

	sum(&cpu);
	handle_result(&cpu,&mem);

	
	return 0;
}
