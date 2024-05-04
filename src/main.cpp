#include "h_files/libcpu.h"
#include "h_files/libmem.h"

int main(){
	hls::stream<uint32_t,100> program;


	program.write(0x00A50513);
	program.write(0x0011F293);
	program.write(0x00029463);
	program.write(0x00320233);
	program.write(0x00118193);
	program.write(0xFE3518E3);


	run_cpu(program);
	return 0;
}
