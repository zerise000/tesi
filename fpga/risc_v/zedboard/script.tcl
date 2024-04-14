############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project risc_v
add_files ../src/c_files/libcpu.c
add_files ../src/h_files/libcpu.h
add_files ../src/c_files/libmem.c
add_files ../src/h_files/libmem.h
add_files -tb ../src/main.c
open_solution "zedboard" -flow_target vivado
set_part {xc7a200tfbg676-2}
create_clock -period 10 -name default
#source "./risc_v/zedboard/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
