#include "h_files/libcpu.h"
#include "h_files/libmem.h"
#include <stdint.h>

int main(){
	RiscV cpu;
	Memory mem;

	init_registers(&cpu);
	init_mem(&mem);

	mem.buffer[0] = 0x33;
	mem.buffer[1] = 0x01;

	uint32_t instr = fetch(&mem,0); 

	gen_control_signals(&cpu,instr);
	uint8_t ALU_signal = gen_ALU_signal(&cpu,instr);	

	uint64_t op1 = get_first_operand(&cpu,instr);
	uint64_t op2 = get_second_operand(&cpu,instr);

	sum(&cpu,op1,op2,ALU_signal,instr);

	return 0;
}
