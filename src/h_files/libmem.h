#ifndef __LIBMATH_H__
#define __LIBMATH_H__

#include <stdint.h>
#include "hls_stream.h"
#include "hls_task.h"


#define MEM_SIZE 4096
#define CHANNEL_SIZE 10
#define HLS_TASK_ALLOW_NON_STREAM_ARGS


typedef struct{
  uint8_t instr_buff[MEM_SIZE];
  uint8_t data_buff[MEM_SIZE];
  hls::stream<uint32_t, CHANNEL_SIZE> addr_in;
} Memory;


void init_mem(Memory* mem);
uint8_t read_instr(Memory mem,uint16_t loc);
void fetch(Memory* mem,hls::stream<uint32_t> &out);

#endif
