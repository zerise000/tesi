#ifndef __LIBMATH_H__
#define __LIBMATH_H__

#include <stdint.h>
#include <stdint.h>
#define MEM_SIZE 4096

typedef struct{
	uint8_t buffer[MEM_SIZE];
} Memory;


void init_mem(Memory* mem);
uint8_t read_cell(Memory* mem,uint64_t loc);
uint32_t fetch(Memory* mem,uint64_t pc);

#endif
