#include "../h_files/libmem.h"
#include <stdint.h>

void init_mem(Memory* mem){
	for(int i=0; i<MEM_SIZE; i++){
		mem->instr_buff[i] = 0;
		mem->data_buff[i] = 0;
	}
}

uint8_t read_instr(Memory mem,uint16_t loc){
  return mem.instr_buff[loc % MEM_SIZE];
}


uint32_t fetch(Memory mem,uint16_t pc){
	uint32_t instruction=0;

	if(pc+4<MEM_SIZE){
		for(int i=0; i<4; i++){
			instruction += mem.instr_buff[pc+i] << 8*i;
		}
	}

	return instruction;
}
