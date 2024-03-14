#ifndef __LIBCPU_H__
#define __LIBCPU_H__

#include <stdint.h>
#include <stdbool.h>

#define NR_REGISTERS 32


typedef struct {
	uint64_t registers[NR_REGISTERS];

	bool memWrite;
	bool ALUOp[2];
	bool regWrite;
	bool branch;
	bool memToReg;
	bool memRead;
	bool ALUSrc;

	uint64_t pc;

} RiscV;

void init_registers(RiscV* cpu);
void gen_control_signals(RiscV* cpu,uint32_t instr);
uint8_t gen_ALU_signal(RiscV* cpu,uint32_t instr);
uint64_t get_first_operand(RiscV* cpu,uint32_t instr);
uint64_t get_second_operand(RiscV* cpu,uint32_t instr);
void sum(RiscV* cpu,uint64_t r1,uint64_t r2,uint8_t ALU_code,uint32_t instr);

#endif
