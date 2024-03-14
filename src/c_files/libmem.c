#include "../h_files/libmem.h"
#include <stdint.h>

void init_mem(Memory* mem){
	for(int i=0; i<MEM_SIZE; i++){
		mem->buffer[i] = 0;
	}
}

uint8_t read_cell(Memory* mem,uint64_t loc){
	uint8_t content=0;
	if(loc<MEM_SIZE){
		content = mem->buffer[loc];
	}
	return content;
}


uint32_t fetch(Memory* mem,uint64_t pc){
	uint32_t instruction=0;

	if(pc+4<MEM_SIZE){
		for(int i=0; i<4; i++){
			instruction += mem->buffer[pc+i] << 8*i;
		}
	}

	return instruction;
}
