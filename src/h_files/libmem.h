#ifndef __LIBMATH_H__
#define __LIBMATH_H__

#include <stdint.h>

#define MEM_SIZE 4096
typedef struct{
  uint8_t instr_buff[MEM_SIZE];
  uint8_t data_buff[MEM_SIZE];
} Memory;


void init_mem(Memory* mem);
uint8_t read_instr(Memory mem,uint16_t loc);
uint32_t fetch(Memory mem,uint16_t pc);

// zedboard artix XC7A100T-CSG324-1
// XC7Z020-CLG4841-1

#endif
