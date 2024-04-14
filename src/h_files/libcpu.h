#ifndef __LIBCPU_H__
#define __LIBCPU_H__

#include <stdint.h>
#include <stdbool.h>
#include "libmem.h"

#define NR_REGISTERS 32


typedef struct {
	uint64_t registers[NR_REGISTERS];

	bool memWrite;

	bool regWrite;
	bool branch;
	bool memToReg;
	bool memRead;
	bool ALUSrc;

	bool ALUOp[2];

	uint8_t branch_op;
	uint32_t instr;
	uint64_t immediate;

	uint16_t pc;

} Arch;

void init_registers(Arch* cpu);
void gen_control_signals(Arch* cpu);

uint8_t gen_ALU_signal(Arch* cpu);
uint64_t get_first_operand(Arch* cpu);
uint64_t get_second_operand(Arch* cpu);

void handle_result(Arch* cpu,Memory* mem,uint64_t result);
uint64_t sum(Arch* cpu,uint8_t ALU_code);
void def_immediate(Arch* cpu);


#endif
