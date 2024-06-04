#ifndef __LIBCPU_H__
#define __LIBCPU_H__

#include <stdint.h>
#include <stdbool.h>
#include "libmem.h"
#include "hls_stream.h"

#define NR_REGISTERS 32
#define NR_CSR 4096

enum Exception{
	ILLEGAL_INSTR=2
};

enum Exec_mode{
	S = 1,
	M = 3,
	U = 0
};

enum CSR{
	SSTATUS = 0x100,
	STVEC = 0x105,
	SEPC = 0x141,
	SCAUSE = 0x142,
	STVAL = 0x143,
	MSTATUS = 0x300,
	MTVEC = 0x305,
	MEPC = 0x341,
	MCAUSE = 0x342,
	MTVAL = 0x343
};

typedef struct {
	uint64_t registers[NR_REGISTERS];
	uint64_t csr_registers[NR_CSR];

	bool memWrite;

	bool regWrite;
	bool branch;
	bool memToReg;
	bool memRead;
	bool ALUSrc;

	Exec_mode curr_mode;

	hls::stream<uint32_t> instr_in;
	hls::stream<uint8_t> ALU_signal;
	hls::stream<uint8_t> branch_op;
	hls::stream<uint64_t> ALU_result;
	hls::stream<uint16_t> next_instr;


	uint16_t pc;


} Arch;

void init_registers(Arch* cpu);
void gen_control_signals(Arch* cpu,uint8_t opcode);

void gen_ALU_signal(uint8_t opcode,uint8_t funct3,uint8_t funct7,hls::stream<uint8_t> &ALU_signal);
uint64_t get_first_operand(Arch* cpu,uint8_t opcode,uint8_t rd,uint8_t s_rd);
uint64_t get_second_operand(Arch* cpu,uint8_t rd,uint64_t immediate);

void check_branch_type(uint8_t opcode,uint8_t funct3,bool* branch,hls::stream<uint8_t> &branch_op);
void next_instr(Arch* cpu,uint64_t immediate);
void handle_result(Arch* cpu,Bus* bus,uint32_t instr);
void sum(Arch* cpu,uint32_t instr,uint8_t opcode,uint64_t immediate);
void def_immediate(uint32_t instr,uint8_t opcode,uint8_t func3,uint64_t* immediate);

void run_exception(Arch* cpu,Exception exc_type);

void run_cpu();

#endif
