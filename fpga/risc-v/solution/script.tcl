############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project risc-v
set_top run_cpu
add_files ../src/h_files/lib_bus.h
add_files ../src/cpp_files/libcpu.cpp
add_files ../src/h_files/libcpu.h
add_files ../src/cpp_files/libmem.cpp
add_files ../src/h_files/libmem.h
add_files -tb ../src/main.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
#source "./risc-v/solution/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
