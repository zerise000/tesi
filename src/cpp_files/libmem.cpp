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


void fetch(Memory* mem,hls::stream<uint32_t> &out){
#pragma HLS STABLE variable=mem->instr_buff
#pragma HLS INTERFACE mode=m_axi port=mem->instr_buff

	uint32_t instruction=0;
	uint32_t pc = mem->addr_in.read();


	if(pc+4<MEM_SIZE){
		for(int i=0; i<4; i++){
			instruction += mem->instr_buff[pc+i] << 8*i;
		}
	}

	out.write(instruction);
}

void load_program(Memory* mem){
	uint32_t index=0;
	uint32_t instr=0;

	while(!mem->instr_in.empty()){
		if(index+4 > MEM_SIZE)
			exit(1);

		instr = mem->instr_in.read();

		for(int i=0; i<4; i++)
			mem->instr_buff[index+i] = (instr >> 8*i) & 0xFF;

		index+=4;

	}
}
