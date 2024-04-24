set moduleName next_instr
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {next_instr}
set C_modelType { void 0 }
set C_modelArgList {
	{ cpu_registers int 64 unused {array 32 { } 0 1 }  }
	{ cpu_memWrite int 1 unused {pointer 0}  }
	{ cpu_regWrite int 1 unused {pointer 0}  }
	{ cpu_branch int 1 regular {pointer 0}  }
	{ cpu_memToReg int 1 unused {pointer 0}  }
	{ cpu_memRead int 1 unused {pointer 0}  }
	{ cpu_ALUSrc int 1 unused {pointer 0}  }
	{ cpu_ALUOp int 1 unused {array 2 { } 0 1 }  }
	{ cpu_branch_op int 8 regular {pointer 0}  }
	{ cpu_instr int 32 unused {pointer 0}  }
	{ cpu_immediate int 64 regular {pointer 0}  }
	{ cpu_instr_in int 32 unused {pointer 0}  }
	{ cpu_ALU_signal int 8 unused {pointer 0}  }
	{ cpu_ALU_result int 64 unused {pointer 0}  }
	{ cpu_pc int 16 regular {pointer 2}  }
	{ sub_res int 64 regular  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "cpu_registers", "interface" : "memory", "bitwidth" : 64, "direction" : "NONE"} , 
 	{ "Name" : "cpu_memWrite", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_regWrite", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_branch", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_memToReg", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_memRead", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_ALUSrc", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_ALUOp", "interface" : "memory", "bitwidth" : 1, "direction" : "NONE"} , 
 	{ "Name" : "cpu_branch_op", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_instr", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_immediate", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_instr_in", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_ALU_signal", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_ALU_result", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "cpu_pc", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "sub_res", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cpu_registers_address0 sc_out sc_lv 5 signal 0 } 
	{ cpu_registers_ce0 sc_out sc_logic 1 signal 0 } 
	{ cpu_registers_we0 sc_out sc_logic 1 signal 0 } 
	{ cpu_registers_d0 sc_out sc_lv 64 signal 0 } 
	{ cpu_registers_q0 sc_in sc_lv 64 signal 0 } 
	{ cpu_registers_address1 sc_out sc_lv 5 signal 0 } 
	{ cpu_registers_ce1 sc_out sc_logic 1 signal 0 } 
	{ cpu_registers_we1 sc_out sc_logic 1 signal 0 } 
	{ cpu_registers_d1 sc_out sc_lv 64 signal 0 } 
	{ cpu_registers_q1 sc_in sc_lv 64 signal 0 } 
	{ cpu_memWrite sc_in sc_lv 1 signal 1 } 
	{ cpu_regWrite sc_in sc_lv 1 signal 2 } 
	{ cpu_branch sc_in sc_lv 1 signal 3 } 
	{ cpu_memToReg sc_in sc_lv 1 signal 4 } 
	{ cpu_memRead sc_in sc_lv 1 signal 5 } 
	{ cpu_ALUSrc sc_in sc_lv 1 signal 6 } 
	{ cpu_ALUOp_address0 sc_out sc_lv 1 signal 7 } 
	{ cpu_ALUOp_ce0 sc_out sc_logic 1 signal 7 } 
	{ cpu_ALUOp_we0 sc_out sc_logic 1 signal 7 } 
	{ cpu_ALUOp_d0 sc_out sc_lv 1 signal 7 } 
	{ cpu_ALUOp_q0 sc_in sc_lv 1 signal 7 } 
	{ cpu_ALUOp_address1 sc_out sc_lv 1 signal 7 } 
	{ cpu_ALUOp_ce1 sc_out sc_logic 1 signal 7 } 
	{ cpu_ALUOp_we1 sc_out sc_logic 1 signal 7 } 
	{ cpu_ALUOp_d1 sc_out sc_lv 1 signal 7 } 
	{ cpu_ALUOp_q1 sc_in sc_lv 1 signal 7 } 
	{ cpu_branch_op sc_in sc_lv 8 signal 8 } 
	{ cpu_instr sc_in sc_lv 32 signal 9 } 
	{ cpu_immediate sc_in sc_lv 64 signal 10 } 
	{ cpu_instr_in sc_in sc_lv 32 signal 11 } 
	{ cpu_ALU_signal sc_in sc_lv 8 signal 12 } 
	{ cpu_ALU_result sc_in sc_lv 64 signal 13 } 
	{ cpu_pc_i sc_in sc_lv 16 signal 14 } 
	{ cpu_pc_o sc_out sc_lv 16 signal 14 } 
	{ cpu_pc_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ sub_res sc_in sc_lv 64 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cpu_registers_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "cpu_registers", "role": "address0" }} , 
 	{ "name": "cpu_registers_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_registers", "role": "ce0" }} , 
 	{ "name": "cpu_registers_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_registers", "role": "we0" }} , 
 	{ "name": "cpu_registers_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "cpu_registers", "role": "d0" }} , 
 	{ "name": "cpu_registers_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "cpu_registers", "role": "q0" }} , 
 	{ "name": "cpu_registers_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "cpu_registers", "role": "address1" }} , 
 	{ "name": "cpu_registers_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_registers", "role": "ce1" }} , 
 	{ "name": "cpu_registers_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_registers", "role": "we1" }} , 
 	{ "name": "cpu_registers_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "cpu_registers", "role": "d1" }} , 
 	{ "name": "cpu_registers_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "cpu_registers", "role": "q1" }} , 
 	{ "name": "cpu_memWrite", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_memWrite", "role": "default" }} , 
 	{ "name": "cpu_regWrite", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_regWrite", "role": "default" }} , 
 	{ "name": "cpu_branch", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_branch", "role": "default" }} , 
 	{ "name": "cpu_memToReg", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_memToReg", "role": "default" }} , 
 	{ "name": "cpu_memRead", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_memRead", "role": "default" }} , 
 	{ "name": "cpu_ALUSrc", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUSrc", "role": "default" }} , 
 	{ "name": "cpu_ALUOp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "address0" }} , 
 	{ "name": "cpu_ALUOp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "ce0" }} , 
 	{ "name": "cpu_ALUOp_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "we0" }} , 
 	{ "name": "cpu_ALUOp_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "d0" }} , 
 	{ "name": "cpu_ALUOp_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "q0" }} , 
 	{ "name": "cpu_ALUOp_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "address1" }} , 
 	{ "name": "cpu_ALUOp_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "ce1" }} , 
 	{ "name": "cpu_ALUOp_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "we1" }} , 
 	{ "name": "cpu_ALUOp_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "d1" }} , 
 	{ "name": "cpu_ALUOp_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cpu_ALUOp", "role": "q1" }} , 
 	{ "name": "cpu_branch_op", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "cpu_branch_op", "role": "default" }} , 
 	{ "name": "cpu_instr", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cpu_instr", "role": "default" }} , 
 	{ "name": "cpu_immediate", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "cpu_immediate", "role": "default" }} , 
 	{ "name": "cpu_instr_in", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cpu_instr_in", "role": "default" }} , 
 	{ "name": "cpu_ALU_signal", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "cpu_ALU_signal", "role": "default" }} , 
 	{ "name": "cpu_ALU_result", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "cpu_ALU_result", "role": "default" }} , 
 	{ "name": "cpu_pc_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "cpu_pc", "role": "i" }} , 
 	{ "name": "cpu_pc_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "cpu_pc", "role": "o" }} , 
 	{ "name": "cpu_pc_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cpu_pc", "role": "o_ap_vld" }} , 
 	{ "name": "sub_res", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sub_res", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "next_instr",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cpu_registers", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "cpu_memWrite", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_regWrite", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_branch", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_memToReg", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_memRead", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_ALUSrc", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_ALUOp", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "cpu_branch_op", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_instr", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_immediate", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_instr_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_ALU_signal", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_ALU_result", "Type" : "None", "Direction" : "I"},
			{"Name" : "cpu_pc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sub_res", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	next_instr {
		cpu_registers {Type X LastRead -1 FirstWrite -1}
		cpu_memWrite {Type I LastRead -1 FirstWrite -1}
		cpu_regWrite {Type I LastRead -1 FirstWrite -1}
		cpu_branch {Type I LastRead 0 FirstWrite -1}
		cpu_memToReg {Type I LastRead -1 FirstWrite -1}
		cpu_memRead {Type I LastRead -1 FirstWrite -1}
		cpu_ALUSrc {Type I LastRead -1 FirstWrite -1}
		cpu_ALUOp {Type X LastRead -1 FirstWrite -1}
		cpu_branch_op {Type I LastRead 0 FirstWrite -1}
		cpu_instr {Type I LastRead -1 FirstWrite -1}
		cpu_immediate {Type I LastRead 0 FirstWrite -1}
		cpu_instr_in {Type I LastRead -1 FirstWrite -1}
		cpu_ALU_signal {Type I LastRead -1 FirstWrite -1}
		cpu_ALU_result {Type I LastRead -1 FirstWrite -1}
		cpu_pc {Type IO LastRead 1 FirstWrite 1}
		sub_res {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cpu_registers { ap_memory {  { cpu_registers_address0 mem_address 1 5 }  { cpu_registers_ce0 mem_ce 1 1 }  { cpu_registers_we0 mem_we 1 1 }  { cpu_registers_d0 mem_din 1 64 }  { cpu_registers_q0 mem_dout 0 64 }  { cpu_registers_address1 MemPortADDR2 1 5 }  { cpu_registers_ce1 MemPortCE2 1 1 }  { cpu_registers_we1 MemPortWE2 1 1 }  { cpu_registers_d1 MemPortDIN2 1 64 }  { cpu_registers_q1 MemPortDOUT2 0 64 } } }
	cpu_memWrite { ap_none {  { cpu_memWrite in_data 0 1 } } }
	cpu_regWrite { ap_none {  { cpu_regWrite in_data 0 1 } } }
	cpu_branch { ap_none {  { cpu_branch in_data 0 1 } } }
	cpu_memToReg { ap_none {  { cpu_memToReg in_data 0 1 } } }
	cpu_memRead { ap_none {  { cpu_memRead in_data 0 1 } } }
	cpu_ALUSrc { ap_none {  { cpu_ALUSrc in_data 0 1 } } }
	cpu_ALUOp { ap_memory {  { cpu_ALUOp_address0 mem_address 1 1 }  { cpu_ALUOp_ce0 mem_ce 1 1 }  { cpu_ALUOp_we0 mem_we 1 1 }  { cpu_ALUOp_d0 mem_din 1 1 }  { cpu_ALUOp_q0 mem_dout 0 1 }  { cpu_ALUOp_address1 MemPortADDR2 1 1 }  { cpu_ALUOp_ce1 MemPortCE2 1 1 }  { cpu_ALUOp_we1 MemPortWE2 1 1 }  { cpu_ALUOp_d1 MemPortDIN2 1 1 }  { cpu_ALUOp_q1 MemPortDOUT2 0 1 } } }
	cpu_branch_op { ap_none {  { cpu_branch_op in_data 0 8 } } }
	cpu_instr { ap_none {  { cpu_instr in_data 0 32 } } }
	cpu_immediate { ap_none {  { cpu_immediate in_data 0 64 } } }
	cpu_instr_in { ap_none {  { cpu_instr_in in_data 0 32 } } }
	cpu_ALU_signal { ap_none {  { cpu_ALU_signal in_data 0 8 } } }
	cpu_ALU_result { ap_none {  { cpu_ALU_result in_data 0 64 } } }
	cpu_pc { ap_ovld {  { cpu_pc_i in_data 0 16 }  { cpu_pc_o out_data 1 16 }  { cpu_pc_o_ap_vld out_vld 1 1 } } }
	sub_res { ap_none {  { sub_res in_data 0 64 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
