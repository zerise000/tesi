#ifndef __LIBCPU_H__
#define __LIBCPU_H__

#include <stdint.h>
#include <stdbool.h>
#include "libmem.h"
#include "hls_stream.h"

#define NR_REGISTERS 32


typedef struct {
	uint64_t registers[NR_REGISTERS];

	bool memWrite;

	bool regWrite;
	bool branch;
	bool memToReg;
	bool memRead;
	bool ALUSrc;


	uint32_t instr;
	uint64_t immediate;

	hls::stream<uint32_t,CHANNEL_SIZE> instr_in;
	hls::stream<uint8_t,CHANNEL_SIZE> ALU_signal;
	hls::stream<uint8_t,CHANNEL_SIZE> branch_op;
	hls::stream<uint64_t,CHANNEL_SIZE> ALU_result;
	hls::stream<uint16_t,CHANNEL_SIZE> next_instr;


	uint16_t pc;


} Arch;

void init_registers(Arch* cpu);
void gen_control_signals(Arch* cpu);

void gen_ALU_signal(Arch* cpu);
uint64_t get_first_operand(Arch* cpu);
uint64_t get_second_operand(Arch* cpu);

void check_branch_type(Arch* cpu);
void next_instr(Arch* cpu);
void handle_result(Arch* cpu,Memory* mem);
void sum(Arch* cpu);
void def_immediate(Arch* cpu);

void run_cpu(hls::stream<uint32_t>& program_in);

#endif
