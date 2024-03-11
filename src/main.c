#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "h_files/libcpu.h"

#define MEM_SIZE 4096

typedef struct{
	uint8_t buffer[MEM_SIZE];
} Memory;


void init_mem(Memory* mem){
	for(size_t i=0; i<MEM_SIZE; i++){
		mem->buffer[i] = 0;
	}
}


int main(){
	RiscV cpu;
	Memory mem;

	init_registers(&cpu);
	init_mem(&mem);

	uint32_t instr = 0x00000133;
	uint8_t opcode = instr & 0x000007F;

	gen_control_signals(&cpu,opcode);
	
	return 0;
}
