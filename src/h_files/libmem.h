#ifndef __LIBMATH_H__
#define __LIBMATH_H__

#include <stdint.h>
#include "lib_bus.h"
#include "hls_task.h"

#define HLS_TASK_ALLOW_NON_STREAM_ARGS
#define MEM_MAP_DATA 0x80000000

void rst_mem();
void write_data(hls::stream<uint16_t> &addr_write_in,hls::stream<uint64_t> &data_in,hls::stream<uint8_t> &data_write_dim);
void read_data(hls::stream<uint16_t> &in,hls::stream<uint8_t> &stream_read_dim,hls::stream<uint64_t> &out);


void init_mem(Bus* bus);


#endif
