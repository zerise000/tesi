#ifndef __LIB_BUS_H__
#define __LIB_BUS_H__

#include "hls_stream.h"
#define CHANNEL_SIZE 10


typedef struct {
	hls::stream<uint16_t> addr_read_in;
	hls::stream<uint8_t> data_read_dim;

	hls::stream<uint32_t> instr_in;
	hls::stream<uint64_t> data_in;

	hls::stream<uint16_t> addr_write_in;
	hls::stream<uint64_t> data_out;
	hls::stream<uint8_t> data_write_dim;

} Bus;


#endif
