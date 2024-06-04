#include "../h_files/libmem.h"

/*before someone asks me "why you didn't defined constants through macro?"
the answer is simple: task didn't see them (at least in my case), so i had to
define them using "const" keyword*/
static const uint32_t mem_size = 128*(0b1<<20);
static const uint32_t cache_size = 4096;

static uint8_t ram_buff[mem_size];
static uint8_t cache_buff[cache_size];

// read and write locks, used to synchronize the two tasks
static bool read_busy = 0;
static bool write_busy = 0;



void write_data(hls::stream<uint16_t> &addr_write_in,hls::stream<uint64_t> &data_in,hls::stream<uint8_t> &data_write_dim){


	//hls::stream implements a blocking read/write system, so this means that the task won't execute
	//next instructions until it doesn't read something from input streams

	uint64_t data = data_in.read();
	uint16_t addr = addr_write_in.read();
	uint8_t data_size = data_write_dim.read();

	//wait until read task has stopped to use memory
	while(read_busy);

	//lock the memory
	write_busy=1;

	for(int i=0; i<data_size/8; i++)
		ram_buff[(addr+i) % mem_size] = ((data>>(8*i)) & 0xFF);


	//unlock memory
	write_busy = 0;
}


void read_data(hls::stream<uint16_t> &in,hls::stream<uint8_t> &stream_read_dim,hls::stream<uint64_t> &out){

	//hls::stream implements a blocking read/write system, so this means that the task won't execute
	//next instructions until it doesn't read something from input streams

	uint32_t data=0;
	uint16_t addr = in.read();
	uint8_t data_size = stream_read_dim.read();

	//wait until write task has stopped to use memory
	while(write_busy);

	//lock the memory
	read_busy = 1;

	for(int i=0; i<data_size/8; i++){
		data += ram_buff[(addr+i % mem_size)] << 8*i;
	}

	//send data back to the CPU
	out.write(data);

	//unlock memory
	read_busy = 0;
}

void init_mem(Bus* bus){
	rst_mem();

#pragma HLS bind_storage variable=ram_buff type=RAM_S2P
#pragma HLS STABLE variable=ram_buff

	hls_thread_local hls::task read_mem_t(read_data,bus->addr_read_in,bus->data_read_dim,bus->data_out);
	hls_thread_local hls::task write_data_t(write_data,bus->addr_write_in,bus->data_in,bus->data_write_dim);
}

void rst_mem(){
	for(int i=0; i<mem_size; i++){
		ram_buff[i] = 0;
	}
}

