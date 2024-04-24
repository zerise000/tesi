; ModuleID = '/home/mattia/uni/tesi/fpga/risc-v/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.Arch = type { [32 x i64], i1, i1, i1, i1, i1, i1, [2 x i1], i8, i32, i64, %"class.hls::stream<unsigned int, 10>", %"class.hls::stream<unsigned char, 10>", %"class.hls::stream<unsigned long, 10>", i16 }
%"class.hls::stream<unsigned int, 10>" = type { %"class.hls::stream<unsigned int, 0>" }
%"class.hls::stream<unsigned int, 0>" = type { i32 }
%"class.hls::stream<unsigned char, 10>" = type { %"class.hls::stream<unsigned char, 0>" }
%"class.hls::stream<unsigned char, 0>" = type { i8 }
%"class.hls::stream<unsigned long, 10>" = type { %"class.hls::stream<unsigned long, 0>" }
%"class.hls::stream<unsigned long, 0>" = type { i64 }

; Function Attrs: argmemonly inaccessiblemem_or_argmemonly noinline
define void @apatb_next_instr_ir(%struct.Arch* noalias nocapture nonnull %cpu, i64 %sub_res) local_unnamed_addr #0 {
entry:
  %cpu_copy.0 = alloca [32 x i64], align 512
  %cpu_copy.1 = alloca i1, align 512
  %cpu_copy.2 = alloca i1, align 512
  %cpu_copy.3 = alloca i1, align 512
  %cpu_copy.4 = alloca i1, align 512
  %cpu_copy.5 = alloca i1, align 512
  %cpu_copy.6 = alloca i1, align 512
  %cpu_copy.7 = alloca [2 x i1], align 512
  %cpu_copy.8 = alloca i8, align 512
  %cpu_copy.9 = alloca i32, align 512
  %cpu_copy.10 = alloca i64, align 512
  %cpu_copy.11 = alloca i32, align 512
  %cpu_copy.12 = alloca i8, align 512
  %cpu_copy.13 = alloca i64, align 512
  %cpu_copy.14 = alloca i16, align 512
  call fastcc void @copy_in(%struct.Arch* nonnull %cpu, [32 x i64]* nonnull align 512 %cpu_copy.0, i1* nonnull align 512 %cpu_copy.1, i1* nonnull align 512 %cpu_copy.2, i1* nonnull align 512 %cpu_copy.3, i1* nonnull align 512 %cpu_copy.4, i1* nonnull align 512 %cpu_copy.5, i1* nonnull align 512 %cpu_copy.6, [2 x i1]* nonnull align 512 %cpu_copy.7, i8* nonnull align 512 %cpu_copy.8, i32* nonnull align 512 %cpu_copy.9, i64* nonnull align 512 %cpu_copy.10, i32* nonnull align 512 %cpu_copy.11, i8* nonnull align 512 %cpu_copy.12, i64* nonnull align 512 %cpu_copy.13, i16* nonnull align 512 %cpu_copy.14)
  call void @apatb_next_instr_hw([32 x i64]* %cpu_copy.0, i1* %cpu_copy.1, i1* %cpu_copy.2, i1* %cpu_copy.3, i1* %cpu_copy.4, i1* %cpu_copy.5, i1* %cpu_copy.6, [2 x i1]* %cpu_copy.7, i8* %cpu_copy.8, i32* %cpu_copy.9, i64* %cpu_copy.10, i32* %cpu_copy.11, i8* %cpu_copy.12, i64* %cpu_copy.13, i16* %cpu_copy.14, i64 %sub_res)
  call void @copy_back(%struct.Arch* %cpu, [32 x i64]* %cpu_copy.0, i1* %cpu_copy.1, i1* %cpu_copy.2, i1* %cpu_copy.3, i1* %cpu_copy.4, i1* %cpu_copy.5, i1* %cpu_copy.6, [2 x i1]* %cpu_copy.7, i8* %cpu_copy.8, i32* %cpu_copy.9, i64* %cpu_copy.10, i32* %cpu_copy.11, i8* %cpu_copy.12, i64* %cpu_copy.13, i16* %cpu_copy.14)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%struct.Arch* noalias "unpacked"="0", [32 x i64]* noalias align 512 "unpacked"="1.0" %.0, i1* noalias nocapture align 512 "unpacked"="1.1" %.1, i1* noalias nocapture align 512 "unpacked"="1.2" %.2, i1* noalias nocapture align 512 "unpacked"="1.3" %.3, i1* noalias nocapture align 512 "unpacked"="1.4" %.4, i1* noalias nocapture align 512 "unpacked"="1.5" %.5, i1* noalias nocapture align 512 "unpacked"="1.6" %.6, [2 x i1]* noalias align 512 "unpacked"="1.7" %.7, i8* noalias nocapture align 512 "unpacked"="1.8" %.8, i32* noalias nocapture align 512 "unpacked"="1.9" %.9, i64* noalias nocapture align 512 "unpacked"="1.10" %.10, i32* noalias nocapture align 512 "unpacked"="1.11.0" %.11, i8* noalias nocapture align 512 "unpacked"="1.12.0" %.12, i64* noalias nocapture align 512 "unpacked"="1.13.0" %.13, i16* noalias nocapture align 512 "unpacked"="1.14" %.14) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Arch([32 x i64]* align 512 %.0, i1* align 512 %.1, i1* align 512 %.2, i1* align 512 %.3, i1* align 512 %.4, i1* align 512 %.5, i1* align 512 %.6, [2 x i1]* align 512 %.7, i8* align 512 %.8, i32* align 512 %.9, i64* align 512 %.10, i32* align 512 %.11, i8* align 512 %.12, i64* align 512 %.13, i16* align 512 %.14, %struct.Arch* %0)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a32i64([32 x i64]* %dst, [32 x i64]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x i64]* %src, null
  %1 = icmp eq [32 x i64]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x i64], [32 x i64]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x i64], [32 x i64]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i64, i64* %src.addr, align 8
  store i64 %3, i64* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a2i1([2 x i1]* %dst, [2 x i1]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x i1]* %src, null
  %1 = icmp eq [2 x i1]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x i1], [2 x i1]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x i1], [2 x i1]* %src, i64 0, i64 %for.loop.idx2
  %3 = bitcast i1* %src.addr to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i1
  store i1 %5, i1* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%struct.Arch* noalias "unpacked"="0", [32 x i64]* noalias readonly align 512 "unpacked"="1.0" %.0, i1* noalias nocapture readonly align 512 "unpacked"="1.1" %.1, i1* noalias nocapture readonly align 512 "unpacked"="1.2" %.2, i1* noalias nocapture readonly align 512 "unpacked"="1.3" %.3, i1* noalias nocapture readonly align 512 "unpacked"="1.4" %.4, i1* noalias nocapture readonly align 512 "unpacked"="1.5" %.5, i1* noalias nocapture readonly align 512 "unpacked"="1.6" %.6, [2 x i1]* noalias readonly align 512 "unpacked"="1.7" %.7, i8* noalias nocapture readonly align 512 "unpacked"="1.8" %.8, i32* noalias nocapture readonly align 512 "unpacked"="1.9" %.9, i64* noalias nocapture readonly align 512 "unpacked"="1.10" %.10, i32* noalias nocapture align 512 "unpacked"="1.11.0" %.11, i8* noalias nocapture align 512 "unpacked"="1.12.0" %.12, i64* noalias nocapture align 512 "unpacked"="1.13.0" %.13, i16* noalias nocapture readonly align 512 "unpacked"="1.14" %.14) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Arch.4(%struct.Arch* %0, [32 x i64]* align 512 %.0, i1* align 512 %.1, i1* align 512 %.2, i1* align 512 %.3, i1* align 512 %.4, i1* align 512 %.5, i1* align 512 %.6, [2 x i1]* align 512 %.7, i8* align 512 %.8, i32* align 512 %.9, i64* align 512 %.10, i32* align 512 %.11, i8* align 512 %.12, i64* align 512 %.13, i16* align 512 %.14)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned long, 10>.14"(i64* noalias nocapture align 512 "unpacked"="0.0", %"class.hls::stream<unsigned long, 10>"* noalias nocapture "unpacked"="1") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<unsigned long, 10>"
  %3 = alloca i64
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<unsigned long, 10>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_8(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<unsigned long, 10>"* %2 to i8*
  %7 = bitcast %"class.hls::stream<unsigned long, 10>"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<unsigned long, 10>", %"class.hls::stream<unsigned long, 10>"* %2
  %.evi = extractvalue %"class.hls::stream<unsigned long, 10>" %8, 0, 0
  store i64 %.evi, i64* %3
  %9 = bitcast i64* %3 to i8*
  %10 = bitcast i64* %0 to i8*
  call void @fpga_fifo_push_8(i8* %9, i8* %10)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned long, 10>.22"(%"class.hls::stream<unsigned long, 10>"* noalias nocapture "unpacked"="0", i64* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #4 {
entry:
  %2 = alloca i64
  %3 = alloca %"class.hls::stream<unsigned long, 10>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i64* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_8(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i64* %2 to i8*
  %7 = bitcast i64* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %6, i8* %7)
  %8 = load volatile i64, i64* %2
  %.ivi = insertvalue %"class.hls::stream<unsigned long, 10>" undef, i64 %8, 0, 0
  store %"class.hls::stream<unsigned long, 10>" %.ivi, %"class.hls::stream<unsigned long, 10>"* %3
  %9 = bitcast %"class.hls::stream<unsigned long, 10>"* %3 to i8*
  %10 = bitcast %"class.hls::stream<unsigned long, 10>"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %9, i8* %10)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned char, 10>.29"(%"class.hls::stream<unsigned char, 10>"* noalias nocapture "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #4 {
entry:
  %2 = alloca i8
  %3 = alloca %"class.hls::stream<unsigned char, 10>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %1)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  call void @fpga_fifo_pop_1(i8* %2, i8* %1)
  %5 = load volatile i8, i8* %2
  %.ivi = insertvalue %"class.hls::stream<unsigned char, 10>" undef, i8 %5, 0, 0
  store %"class.hls::stream<unsigned char, 10>" %.ivi, %"class.hls::stream<unsigned char, 10>"* %3
  %6 = bitcast %"class.hls::stream<unsigned char, 10>"* %3 to i8*
  %7 = bitcast %"class.hls::stream<unsigned char, 10>"* %0 to i8*
  call void @fpga_fifo_push_1(i8* %6, i8* %7)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned char, 10>.37"(i8* noalias nocapture align 512 "unpacked"="0.0", %"class.hls::stream<unsigned char, 10>"* noalias nocapture "unpacked"="1") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<unsigned char, 10>"
  %3 = alloca i8
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<unsigned char, 10>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_1(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<unsigned char, 10>"* %2 to i8*
  %7 = bitcast %"class.hls::stream<unsigned char, 10>"* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<unsigned char, 10>", %"class.hls::stream<unsigned char, 10>"* %2
  %.evi = extractvalue %"class.hls::stream<unsigned char, 10>" %8, 0, 0
  store i8 %.evi, i8* %3
  call void @fpga_fifo_push_1(i8* %3, i8* %0)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0struct.Arch([32 x i64]* noalias align 512 "unpacked"="0.0" %dst.01, i1* noalias nocapture align 512 "unpacked"="0.1" %dst.15, i1* noalias nocapture align 512 "unpacked"="0.2" %dst.26, i1* noalias nocapture align 512 "unpacked"="0.3" %dst.37, i1* noalias nocapture align 512 "unpacked"="0.4" %dst.48, i1* noalias nocapture align 512 "unpacked"="0.5" %dst.59, i1* noalias nocapture align 512 "unpacked"="0.6" %dst.610, [2 x i1]* noalias align 512 "unpacked"="0.7" %dst.711, i8* noalias nocapture align 512 "unpacked"="0.8" %dst.812, i32* noalias nocapture align 512 "unpacked"="0.9" %dst.913, i64* noalias nocapture align 512 "unpacked"="0.10" %dst.1014, i32* noalias nocapture align 512 "unpacked"="0.11.0" %dst.1115, i8* noalias nocapture align 512 "unpacked"="0.12.0" %dst.1216, i64* noalias nocapture align 512 "unpacked"="0.13.0" %dst.1317, i16* noalias nocapture align 512 "unpacked"="0.14" %dst.1418, %struct.Arch* noalias "unpacked"="1" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq %struct.Arch* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 0
  call void @arraycpy_hls.p0a32i64([32 x i64]* %dst.01, [32 x i64]* %src.0, i64 32)
  %src.1 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 1
  %1 = bitcast i1* %src.1 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i1
  store i1 %3, i1* %dst.15, align 512
  %src.2 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 2
  %4 = bitcast i1* %src.2 to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i1
  store i1 %6, i1* %dst.26, align 512
  %src.3 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 3
  %7 = bitcast i1* %src.3 to i8*
  %8 = load i8, i8* %7
  %9 = trunc i8 %8 to i1
  store i1 %9, i1* %dst.37, align 512
  %src.4 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 4
  %10 = bitcast i1* %src.4 to i8*
  %11 = load i8, i8* %10
  %12 = trunc i8 %11 to i1
  store i1 %12, i1* %dst.48, align 512
  %src.5 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 5
  %13 = bitcast i1* %src.5 to i8*
  %14 = load i8, i8* %13
  %15 = trunc i8 %14 to i1
  store i1 %15, i1* %dst.59, align 512
  %src.6 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 6
  %16 = bitcast i1* %src.6 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i1
  store i1 %18, i1* %dst.610, align 512
  %src.7 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 7
  call void @arraycpy_hls.p0a2i1([2 x i1]* %dst.711, [2 x i1]* %src.7, i64 2)
  %src.8 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 8
  %19 = load i8, i8* %src.8, align 1
  store i8 %19, i8* %dst.812, align 512
  %src.9 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 9
  %20 = load i32, i32* %src.9, align 4
  store i32 %20, i32* %dst.913, align 512
  %src.10 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 10
  %21 = load i64, i64* %src.10, align 8
  store i64 %21, i64* %dst.1014, align 512
  %src.11 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 11
  call fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned int, 10>.44"(i32* align 512 %dst.1115, %"class.hls::stream<unsigned int, 10>"* %src.11)
  %src.12 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 12
  call fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned char, 10>.37"(i8* align 512 %dst.1216, %"class.hls::stream<unsigned char, 10>"* %src.12)
  %src.13 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 13
  call fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned long, 10>.14"(i64* align 512 %dst.1317, %"class.hls::stream<unsigned long, 10>"* %src.13)
  %src.14 = getelementptr %struct.Arch, %struct.Arch* %src, i64 0, i32 14
  %22 = load i16, i16* %src.14, align 2
  store i16 %22, i16* %dst.1418, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned int, 10>.44"(i32* noalias nocapture align 512 "unpacked"="0.0", %"class.hls::stream<unsigned int, 10>"* noalias nocapture "unpacked"="1") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<unsigned int, 10>"
  %3 = alloca i32
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<unsigned int, 10>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<unsigned int, 10>"* %2 to i8*
  %7 = bitcast %"class.hls::stream<unsigned int, 10>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<unsigned int, 10>", %"class.hls::stream<unsigned int, 10>"* %2
  %.evi = extractvalue %"class.hls::stream<unsigned int, 10>" %8, 0, 0
  store i32 %.evi, i32* %3
  %9 = bitcast i32* %3 to i8*
  %10 = bitcast i32* %0 to i8*
  call void @fpga_fifo_push_4(i8* %9, i8* %10)
  br label %empty, !llvm.loop !10

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0struct.Arch.4(%struct.Arch* noalias "unpacked"="0" %dst, [32 x i64]* noalias readonly align 512 "unpacked"="1.0" %src.01, i1* noalias nocapture readonly align 512 "unpacked"="1.1" %src.15, i1* noalias nocapture readonly align 512 "unpacked"="1.2" %src.26, i1* noalias nocapture readonly align 512 "unpacked"="1.3" %src.37, i1* noalias nocapture readonly align 512 "unpacked"="1.4" %src.48, i1* noalias nocapture readonly align 512 "unpacked"="1.5" %src.59, i1* noalias nocapture readonly align 512 "unpacked"="1.6" %src.610, [2 x i1]* noalias readonly align 512 "unpacked"="1.7" %src.711, i8* noalias nocapture readonly align 512 "unpacked"="1.8" %src.812, i32* noalias nocapture readonly align 512 "unpacked"="1.9" %src.913, i64* noalias nocapture readonly align 512 "unpacked"="1.10" %src.1014, i32* noalias nocapture align 512 "unpacked"="1.11.0" %src.1115, i8* noalias nocapture align 512 "unpacked"="1.12.0" %src.1216, i64* noalias nocapture align 512 "unpacked"="1.13.0" %src.1317, i16* noalias nocapture readonly align 512 "unpacked"="1.14" %src.1418) unnamed_addr #5 {
entry:
  %0 = icmp eq %struct.Arch* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 0
  call void @arraycpy_hls.p0a32i64([32 x i64]* %dst.0, [32 x i64]* %src.01, i64 32)
  %dst.1 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 1
  %1 = bitcast i1* %src.15 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i1
  store i1 %3, i1* %dst.1, align 1
  %dst.2 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 2
  %4 = bitcast i1* %src.26 to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i1
  store i1 %6, i1* %dst.2, align 1
  %dst.3 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 3
  %7 = bitcast i1* %src.37 to i8*
  %8 = load i8, i8* %7
  %9 = trunc i8 %8 to i1
  store i1 %9, i1* %dst.3, align 1
  %dst.4 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 4
  %10 = bitcast i1* %src.48 to i8*
  %11 = load i8, i8* %10
  %12 = trunc i8 %11 to i1
  store i1 %12, i1* %dst.4, align 1
  %dst.5 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 5
  %13 = bitcast i1* %src.59 to i8*
  %14 = load i8, i8* %13
  %15 = trunc i8 %14 to i1
  store i1 %15, i1* %dst.5, align 1
  %dst.6 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 6
  %16 = bitcast i1* %src.610 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i1
  store i1 %18, i1* %dst.6, align 1
  %dst.7 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 7
  call void @arraycpy_hls.p0a2i1([2 x i1]* %dst.7, [2 x i1]* %src.711, i64 2)
  %dst.8 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 8
  %19 = load i8, i8* %src.812, align 512
  store i8 %19, i8* %dst.8, align 1
  %dst.9 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 9
  %20 = load i32, i32* %src.913, align 512
  store i32 %20, i32* %dst.9, align 4
  %dst.10 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 10
  %21 = load i64, i64* %src.1014, align 512
  store i64 %21, i64* %dst.10, align 8
  %dst.11 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 11
  call fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned int, 10>.52"(%"class.hls::stream<unsigned int, 10>"* %dst.11, i32* align 512 %src.1115)
  %dst.12 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 12
  call fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned char, 10>.29"(%"class.hls::stream<unsigned char, 10>"* %dst.12, i8* align 512 %src.1216)
  %dst.13 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 13
  call fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned long, 10>.22"(%"class.hls::stream<unsigned long, 10>"* %dst.13, i64* align 512 %src.1317)
  %dst.14 = getelementptr %struct.Arch, %struct.Arch* %dst, i64 0, i32 14
  %22 = load i16, i16* %src.1418, align 512
  store i16 %22, i16* %dst.14, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<unsigned int, 10>.52"(%"class.hls::stream<unsigned int, 10>"* noalias nocapture "unpacked"="0", i32* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #4 {
entry:
  %2 = alloca i32
  %3 = alloca %"class.hls::stream<unsigned int, 10>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i32* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i32* %2 to i8*
  %7 = bitcast i32* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile i32, i32* %2
  %.ivi = insertvalue %"class.hls::stream<unsigned int, 10>" undef, i32 %8, 0, 0
  store %"class.hls::stream<unsigned int, 10>" %.ivi, %"class.hls::stream<unsigned int, 10>"* %3
  %9 = bitcast %"class.hls::stream<unsigned int, 10>"* %3 to i8*
  %10 = bitcast %"class.hls::stream<unsigned int, 10>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %9, i8* %10)
  br label %empty, !llvm.loop !11

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_next_instr_hw([32 x i64]*, i1*, i1*, i1*, i1*, i1*, i1*, [2 x i1]*, i8*, i32*, i64*, i32*, i8*, i64*, i16*, i64)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%struct.Arch* noalias "unpacked"="0", [32 x i64]* noalias readonly align 512 "unpacked"="1.0" %.0, i1* noalias nocapture readonly align 512 "unpacked"="1.1" %.1, i1* noalias nocapture readonly align 512 "unpacked"="1.2" %.2, i1* noalias nocapture readonly align 512 "unpacked"="1.3" %.3, i1* noalias nocapture readonly align 512 "unpacked"="1.4" %.4, i1* noalias nocapture readonly align 512 "unpacked"="1.5" %.5, i1* noalias nocapture readonly align 512 "unpacked"="1.6" %.6, [2 x i1]* noalias readonly align 512 "unpacked"="1.7" %.7, i8* noalias nocapture readonly align 512 "unpacked"="1.8" %.8, i32* noalias nocapture readonly align 512 "unpacked"="1.9" %.9, i64* noalias nocapture readonly align 512 "unpacked"="1.10" %.10, i32* noalias nocapture align 512 "unpacked"="1.11.0" %.11, i8* noalias nocapture align 512 "unpacked"="1.12.0" %.12, i64* noalias nocapture align 512 "unpacked"="1.13.0" %.13, i16* noalias nocapture readonly align 512 "unpacked"="1.14" %.14) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Arch.4(%struct.Arch* %0, [32 x i64]* align 512 %.0, i1* align 512 %.1, i1* align 512 %.2, i1* align 512 %.3, i1* align 512 %.4, i1* align 512 %.5, i1* align 512 %.6, [2 x i1]* align 512 %.7, i8* align 512 %.8, i32* align 512 %.9, i64* align 512 %.10, i32* align 512 %.11, i8* align 512 %.12, i64* align 512 %.13, i16* align 512 %.14)
  ret void
}

define void @next_instr_hw_stub_wrapper([32 x i64]*, i1*, i1*, i1*, i1*, i1*, i1*, [2 x i1]*, i8*, i32*, i64*, i32*, i8*, i64*, i16*, i64) #6 {
entry:
  %16 = alloca %struct.Arch
  call void @copy_out(%struct.Arch* %16, [32 x i64]* %0, i1* %1, i1* %2, i1* %3, i1* %4, i1* %5, i1* %6, [2 x i1]* %7, i8* %8, i32* %9, i64* %10, i32* %11, i8* %12, i64* %13, i16* %14)
  call void @next_instr_hw_stub(%struct.Arch* %16, i64 %15)
  call void @copy_in(%struct.Arch* %16, [32 x i64]* %0, i1* %1, i1* %2, i1* %3, i1* %4, i1* %5, i1* %6, [2 x i1]* %7, i8* %8, i32* %9, i64* %10, i32* %11, i8* %12, i64* %13, i16* %14)
  ret void
}

declare void @next_instr_hw_stub(%struct.Arch*, i64)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

attributes #0 = { argmemonly inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
