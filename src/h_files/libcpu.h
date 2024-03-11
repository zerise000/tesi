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
void gen_control_signals(RiscV* cpu,uint8_t opcode);

#endif
