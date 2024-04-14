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

	cpu.instr = fetch(mem,0); 

	def_immediate(&cpu);
	gen_control_signals(&cpu);
	uint8_t ALU_signal = gen_ALU_signal(&cpu);	

	uint64_t res = sum(&cpu,ALU_signal);
	handle_result(&cpu,&mem,res);		
	
	return 0;
}
