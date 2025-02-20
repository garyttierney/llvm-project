; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+zfh,+experimental-zvfh,+v -target-abi=ilp32d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,CHECK32
; RUN: llc -mtriple=riscv64 -mattr=+d,+zfh,+experimental-zvfh,+v -target-abi=lp64d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,CHECK64

; Float

declare <vscale x 2 x i32> @llvm.fptosi.sat.nxv2f32.nxv2i32(<vscale x 2 x float>)
declare <vscale x 4 x i32> @llvm.fptosi.sat.nxv4f32.nxv4i32(<vscale x 4 x float>)
declare <vscale x 8 x i32> @llvm.fptosi.sat.nxv8f32.nxv8i32(<vscale x 8 x float>)
declare <vscale x 4 x i16> @llvm.fptosi.sat.nxv4f32.nxv4i16(<vscale x 4 x float>)
declare <vscale x 8 x i16> @llvm.fptosi.sat.nxv8f32.nxv8i16(<vscale x 8 x float>)
declare <vscale x 2 x i64> @llvm.fptosi.sat.nxv2f32.nxv2i64(<vscale x 2 x float>)
declare <vscale x 4 x i64> @llvm.fptosi.sat.nxv4f32.nxv4i64(<vscale x 4 x float>)

define <vscale x 2 x i32> @test_signed_v2f32_v2i32(<vscale x 2 x float> %f) {
; CHECK32-LABEL: test_signed_v2f32_v2i32:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI0_0)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI0_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    lui a0, %hi(.LCPI0_1)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI0_1)(a0)
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v9, v8
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vmfne.vv v8, v8, v8
; CHECK32-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK32-NEXT:    vmv.v.v v0, v8
; CHECK32-NEXT:    vmerge.vim v8, v9, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v2f32_v2i32:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI0_0)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI0_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v9, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI0_1)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI0_1)(a0)
; CHECK64-NEXT:    li a0, 1
; CHECK64-NEXT:    slli a0, a0, 31
; CHECK64-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    lui a0, 524288
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vmfne.vv v8, v8, v8
; CHECK64-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK64-NEXT:    vmv.v.v v0, v8
; CHECK64-NEXT:    vmerge.vim v8, v9, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 2 x i32> @llvm.fptosi.sat.nxv2f32.nxv2i32(<vscale x 2 x float> %f)
    ret <vscale x 2 x i32> %x
}

define <vscale x 4 x i32> @test_signed_v4f32_v4i32(<vscale x 4 x float> %f) {
; CHECK32-LABEL: test_signed_v4f32_v4i32:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI1_0)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI1_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK32-NEXT:    vmfge.vf v10, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v10
; CHECK32-NEXT:    lui a0, %hi(.LCPI1_1)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI1_1)(a0)
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v10, v8
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    vmerge.vxm v12, v10, a0, v0
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vmfne.vv v10, v8, v8
; CHECK32-NEXT:    vmerge.vxm v8, v12, a0, v0
; CHECK32-NEXT:    vmv1r.v v0, v10
; CHECK32-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v4f32_v4i32:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI1_0)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI1_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmfge.vf v10, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v10
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v10, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI1_1)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI1_1)(a0)
; CHECK64-NEXT:    li a0, 1
; CHECK64-NEXT:    slli a0, a0, 31
; CHECK64-NEXT:    vmerge.vxm v12, v10, a0, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    lui a0, 524288
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vmfne.vv v10, v8, v8
; CHECK64-NEXT:    vmerge.vxm v8, v12, a0, v0
; CHECK64-NEXT:    vmv1r.v v0, v10
; CHECK64-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 4 x i32> @llvm.fptosi.sat.nxv4f32.nxv4i32(<vscale x 4 x float> %f)
    ret <vscale x 4 x i32> %x
}

define <vscale x 8 x i32> @test_signed_v8f32_v8i32(<vscale x 8 x float> %f) {
; CHECK32-LABEL: test_signed_v8f32_v8i32:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI2_0)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI2_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e32, m4, ta, mu
; CHECK32-NEXT:    vmfge.vf v12, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v12
; CHECK32-NEXT:    lui a0, %hi(.LCPI2_1)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI2_1)(a0)
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v12, v8
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    vmerge.vxm v16, v12, a0, v0
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vmfne.vv v12, v8, v8
; CHECK32-NEXT:    vmerge.vxm v8, v16, a0, v0
; CHECK32-NEXT:    vmv1r.v v0, v12
; CHECK32-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v8f32_v8i32:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI2_0)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI2_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e32, m4, ta, mu
; CHECK64-NEXT:    vmfge.vf v12, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v12
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v12, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI2_1)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI2_1)(a0)
; CHECK64-NEXT:    li a0, 1
; CHECK64-NEXT:    slli a0, a0, 31
; CHECK64-NEXT:    vmerge.vxm v16, v12, a0, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    lui a0, 524288
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vmfne.vv v12, v8, v8
; CHECK64-NEXT:    vmerge.vxm v8, v16, a0, v0
; CHECK64-NEXT:    vmv1r.v v0, v12
; CHECK64-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 8 x i32> @llvm.fptosi.sat.nxv8f32.nxv8i32(<vscale x 8 x float> %f)
    ret <vscale x 8 x i32> %x
}

define <vscale x 4 x i16> @test_signed_v4f32_v4i16(<vscale x 4 x float> %f) {
; CHECK-LABEL: test_signed_v4f32_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI3_0)
; CHECK-NEXT:    flw ft0, %lo(.LCPI3_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI3_1)
; CHECK-NEXT:    flw ft1, %lo(.LCPI3_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfmax.vf v10, v8, ft0
; CHECK-NEXT:    vfmin.vf v10, v10, ft1
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v12, v10
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 4 x i16> @llvm.fptosi.sat.nxv4f32.nxv4i16(<vscale x 4 x float> %f)
    ret <vscale x 4 x i16> %x
}

define <vscale x 8 x i16> @test_signed_v8f32_v8i16(<vscale x 8 x float> %f) {
; CHECK-LABEL: test_signed_v8f32_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI4_0)
; CHECK-NEXT:    flw ft0, %lo(.LCPI4_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI4_1)
; CHECK-NEXT:    flw ft1, %lo(.LCPI4_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e32, m4, ta, mu
; CHECK-NEXT:    vfmax.vf v12, v8, ft0
; CHECK-NEXT:    vfmin.vf v12, v12, ft1
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v16, v12
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v16, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 8 x i16> @llvm.fptosi.sat.nxv8f32.nxv8i16(<vscale x 8 x float> %f)
    ret <vscale x 8 x i16> %x
}

define <vscale x 2 x i64> @test_signed_v2f32_v2i64(<vscale x 2 x float> %f) {
; CHECK32-LABEL: test_signed_v2f32_v2i64:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    addi sp, sp, -16
; CHECK32-NEXT:    .cfi_def_cfa_offset 16
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    sw zero, 8(sp)
; CHECK32-NEXT:    li a1, -1
; CHECK32-NEXT:    sw a1, 8(sp)
; CHECK32-NEXT:    lui a1, %hi(.LCPI5_0)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI5_0)(a1)
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v10, v8
; CHECK32-NEXT:    lui a0, %hi(.LCPI5_1)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI5_1)(a0)
; CHECK32-NEXT:    addi a0, sp, 8
; CHECK32-NEXT:    vlse64.v v10, (a0), zero, v0.t
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    vlse64.v v10, (a0), zero, v0.t
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK32-NEXT:    addi sp, sp, 16
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v2f32_v2i64:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI5_0)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI5_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v10, v8
; CHECK64-NEXT:    li a0, -1
; CHECK64-NEXT:    lui a1, %hi(.LCPI5_1)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI5_1)(a1)
; CHECK64-NEXT:    slli a1, a0, 63
; CHECK64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmerge.vxm v10, v10, a1, v0
; CHECK64-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    srli a0, a0, 1
; CHECK64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 2 x i64> @llvm.fptosi.sat.nxv2f32.nxv2i64(<vscale x 2 x float> %f)
    ret <vscale x 2 x i64> %x
}

define <vscale x 4 x i64> @test_signed_v4f32_v4i64(<vscale x 4 x float> %f) {
; CHECK32-LABEL: test_signed_v4f32_v4i64:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    addi sp, sp, -16
; CHECK32-NEXT:    .cfi_def_cfa_offset 16
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    sw zero, 8(sp)
; CHECK32-NEXT:    li a1, -1
; CHECK32-NEXT:    sw a1, 8(sp)
; CHECK32-NEXT:    lui a1, %hi(.LCPI6_0)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI6_0)(a1)
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK32-NEXT:    vmfge.vf v10, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v10
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v12, v8
; CHECK32-NEXT:    lui a0, %hi(.LCPI6_1)
; CHECK32-NEXT:    flw ft0, %lo(.LCPI6_1)(a0)
; CHECK32-NEXT:    addi a0, sp, 8
; CHECK32-NEXT:    vlse64.v v12, (a0), zero, v0.t
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    vlse64.v v12, (a0), zero, v0.t
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK32-NEXT:    addi sp, sp, 16
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v4f32_v4i64:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI6_0)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI6_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmfge.vf v10, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v10
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v12, v8
; CHECK64-NEXT:    li a0, -1
; CHECK64-NEXT:    lui a1, %hi(.LCPI6_1)
; CHECK64-NEXT:    flw ft0, %lo(.LCPI6_1)(a1)
; CHECK64-NEXT:    slli a1, a0, 63
; CHECK64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmerge.vxm v12, v12, a1, v0
; CHECK64-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    srli a0, a0, 1
; CHECK64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 4 x i64> @llvm.fptosi.sat.nxv4f32.nxv4i64(<vscale x 4 x float> %f)
    ret <vscale x 4 x i64> %x
}

; Double

declare <vscale x 2 x i32> @llvm.fptosi.sat.nxv2f64.nxv2i32(<vscale x 2 x double>)
declare <vscale x 4 x i32> @llvm.fptosi.sat.nxv4f64.nxv4i32(<vscale x 4 x double>)
declare <vscale x 8 x i32> @llvm.fptosi.sat.nxv8f64.nxv8i32(<vscale x 8 x double>)
declare <vscale x 4 x i16> @llvm.fptosi.sat.nxv4f64.nxv4i16(<vscale x 4 x double>)
declare <vscale x 8 x i16> @llvm.fptosi.sat.nxv8f64.nxv8i16(<vscale x 8 x double>)
declare <vscale x 2 x i64> @llvm.fptosi.sat.nxv2f64.nxv2i64(<vscale x 2 x double>)
declare <vscale x 4 x i64> @llvm.fptosi.sat.nxv4f64.nxv4i64(<vscale x 4 x double>)

define <vscale x 2 x i32> @test_signed_v2f64_v2i32(<vscale x 2 x double> %f) {
; CHECK-LABEL: test_signed_v2f64_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI7_0)
; CHECK-NEXT:    fld ft0, %lo(.LCPI7_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI7_1)
; CHECK-NEXT:    fld ft1, %lo(.LCPI7_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfmax.vf v10, v8, ft0
; CHECK-NEXT:    vfmin.vf v10, v10, ft1
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v12, v10
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 2 x i32> @llvm.fptosi.sat.nxv2f64.nxv2i32(<vscale x 2 x double> %f)
    ret <vscale x 2 x i32> %x
}

define <vscale x 4 x i32> @test_signed_v4f64_v4i32(<vscale x 4 x double> %f) {
; CHECK-LABEL: test_signed_v4f64_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI8_0)
; CHECK-NEXT:    fld ft0, %lo(.LCPI8_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI8_1)
; CHECK-NEXT:    fld ft1, %lo(.LCPI8_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfmax.vf v12, v8, ft0
; CHECK-NEXT:    vfmin.vf v12, v12, ft1
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v16, v12
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v16, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 4 x i32> @llvm.fptosi.sat.nxv4f64.nxv4i32(<vscale x 4 x double> %f)
    ret <vscale x 4 x i32> %x
}

define <vscale x 8 x i32> @test_signed_v8f64_v8i32(<vscale x 8 x double> %f) {
; CHECK-LABEL: test_signed_v8f64_v8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI9_0)
; CHECK-NEXT:    fld ft0, %lo(.LCPI9_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI9_1)
; CHECK-NEXT:    fld ft1, %lo(.LCPI9_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfmax.vf v16, v8, ft0
; CHECK-NEXT:    vfmin.vf v16, v16, ft1
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v24, v16
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v24, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 8 x i32> @llvm.fptosi.sat.nxv8f64.nxv8i32(<vscale x 8 x double> %f)
    ret <vscale x 8 x i32> %x
}

define <vscale x 4 x i16> @test_signed_v4f64_v4i16(<vscale x 4 x double> %f) {
; CHECK-LABEL: test_signed_v4f64_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI10_0)
; CHECK-NEXT:    fld ft0, %lo(.LCPI10_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI10_1)
; CHECK-NEXT:    fld ft1, %lo(.LCPI10_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfmax.vf v12, v8, ft0
; CHECK-NEXT:    vfmin.vf v12, v12, ft1
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v16, v12
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vnsrl.wi v12, v16, 0
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 4 x i16> @llvm.fptosi.sat.nxv4f64.nxv4i16(<vscale x 4 x double> %f)
    ret <vscale x 4 x i16> %x
}

define <vscale x 8 x i16> @test_signed_v8f64_v8i16(<vscale x 8 x double> %f) {
; CHECK-LABEL: test_signed_v8f64_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI11_0)
; CHECK-NEXT:    fld ft0, %lo(.LCPI11_0)(a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI11_1)
; CHECK-NEXT:    fld ft1, %lo(.LCPI11_1)(a0)
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfmax.vf v16, v8, ft0
; CHECK-NEXT:    vfmin.vf v16, v16, ft1
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v24, v16
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vnsrl.wi v16, v24, 0
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmfne.vv v0, v8, v8
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmerge.vim v8, v16, 0, v0
; CHECK-NEXT:    ret
    %x = call <vscale x 8 x i16> @llvm.fptosi.sat.nxv8f64.nxv8i16(<vscale x 8 x double> %f)
    ret <vscale x 8 x i16> %x
}

define <vscale x 2 x i64> @test_signed_v2f64_v2i64(<vscale x 2 x double> %f) {
; CHECK32-LABEL: test_signed_v2f64_v2i64:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    addi sp, sp, -16
; CHECK32-NEXT:    .cfi_def_cfa_offset 16
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    sw zero, 8(sp)
; CHECK32-NEXT:    li a1, -1
; CHECK32-NEXT:    sw a1, 8(sp)
; CHECK32-NEXT:    lui a1, %hi(.LCPI12_0)
; CHECK32-NEXT:    fld ft0, %lo(.LCPI12_0)(a1)
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK32-NEXT:    vmfge.vf v10, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v10
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v10, v8
; CHECK32-NEXT:    lui a0, %hi(.LCPI12_1)
; CHECK32-NEXT:    fld ft0, %lo(.LCPI12_1)(a0)
; CHECK32-NEXT:    addi a0, sp, 8
; CHECK32-NEXT:    vlse64.v v10, (a0), zero, v0.t
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    vlse64.v v10, (a0), zero, v0.t
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK32-NEXT:    addi sp, sp, 16
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v2f64_v2i64:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI12_0)
; CHECK64-NEXT:    fld ft0, %lo(.LCPI12_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmfge.vf v10, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v10
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v10, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI12_1)
; CHECK64-NEXT:    fld ft0, %lo(.LCPI12_1)(a0)
; CHECK64-NEXT:    li a0, -1
; CHECK64-NEXT:    slli a1, a0, 63
; CHECK64-NEXT:    vmerge.vxm v12, v10, a1, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    srli a0, a0, 1
; CHECK64-NEXT:    vmfne.vv v10, v8, v8
; CHECK64-NEXT:    vmerge.vxm v8, v12, a0, v0
; CHECK64-NEXT:    vmv1r.v v0, v10
; CHECK64-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 2 x i64> @llvm.fptosi.sat.nxv2f64.nxv2i64(<vscale x 2 x double> %f)
    ret <vscale x 2 x i64> %x
}

define <vscale x 4 x i64> @test_signed_v4f64_v4i64(<vscale x 4 x double> %f) {
; CHECK32-LABEL: test_signed_v4f64_v4i64:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    addi sp, sp, -16
; CHECK32-NEXT:    .cfi_def_cfa_offset 16
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    sw zero, 8(sp)
; CHECK32-NEXT:    li a1, -1
; CHECK32-NEXT:    sw a1, 8(sp)
; CHECK32-NEXT:    lui a1, %hi(.LCPI13_0)
; CHECK32-NEXT:    fld ft0, %lo(.LCPI13_0)(a1)
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK32-NEXT:    vmfge.vf v12, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v12
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v12, v8
; CHECK32-NEXT:    lui a0, %hi(.LCPI13_1)
; CHECK32-NEXT:    fld ft0, %lo(.LCPI13_1)(a0)
; CHECK32-NEXT:    addi a0, sp, 8
; CHECK32-NEXT:    vlse64.v v12, (a0), zero, v0.t
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    vlse64.v v12, (a0), zero, v0.t
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK32-NEXT:    addi sp, sp, 16
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v4f64_v4i64:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI13_0)
; CHECK64-NEXT:    fld ft0, %lo(.LCPI13_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmfge.vf v12, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v12
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v12, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI13_1)
; CHECK64-NEXT:    fld ft0, %lo(.LCPI13_1)(a0)
; CHECK64-NEXT:    li a0, -1
; CHECK64-NEXT:    slli a1, a0, 63
; CHECK64-NEXT:    vmerge.vxm v16, v12, a1, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    srli a0, a0, 1
; CHECK64-NEXT:    vmfne.vv v12, v8, v8
; CHECK64-NEXT:    vmerge.vxm v8, v16, a0, v0
; CHECK64-NEXT:    vmv1r.v v0, v12
; CHECK64-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 4 x i64> @llvm.fptosi.sat.nxv4f64.nxv4i64(<vscale x 4 x double> %f)
    ret <vscale x 4 x i64> %x
}


; half

declare <vscale x 2 x i32> @llvm.fptosi.sat.nxv2f16.nxv2i32(<vscale x 2 x half>)
declare <vscale x 4 x i32> @llvm.fptosi.sat.nxv4f16.nxv4i32(<vscale x 4 x half>)
declare <vscale x 8 x i32> @llvm.fptosi.sat.nxv8f16.nxv8i32(<vscale x 8 x half>)
declare <vscale x 4 x i16> @llvm.fptosi.sat.nxv4f16.nxv4i16(<vscale x 4 x half>)
declare <vscale x 8 x i16> @llvm.fptosi.sat.nxv8f16.nxv8i16(<vscale x 8 x half>)
declare <vscale x 2 x i64> @llvm.fptosi.sat.nxv2f16.nxv2i64(<vscale x 2 x half>)
declare <vscale x 4 x i64> @llvm.fptosi.sat.nxv4f16.nxv4i64(<vscale x 4 x half>)

define <vscale x 2 x i32> @test_signed_v2f16_v2i32(<vscale x 2 x half> %f) {
; CHECK32-LABEL: test_signed_v2f16_v2i32:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI14_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI14_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v9, v8
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    lui a1, %hi(.LCPI14_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI14_1)(a1)
; CHECK32-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK32-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK32-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK32-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK32-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v9, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v2f16_v2i32:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI14_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI14_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v9, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI14_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI14_1)(a0)
; CHECK64-NEXT:    li a0, 1
; CHECK64-NEXT:    slli a0, a0, 31
; CHECK64-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    lui a0, 524288
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v9, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 2 x i32> @llvm.fptosi.sat.nxv2f16.nxv2i32(<vscale x 2 x half> %f)
    ret <vscale x 2 x i32> %x
}

define <vscale x 4 x i32> @test_signed_v4f16_v4i32(<vscale x 4 x half> %f) {
; CHECK32-LABEL: test_signed_v4f16_v4i32:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI15_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI15_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v10, v8
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    lui a1, %hi(.LCPI15_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI15_1)(a1)
; CHECK32-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK32-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK32-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK32-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK32-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v4f16_v4i32:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI15_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI15_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v10, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI15_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI15_1)(a0)
; CHECK64-NEXT:    li a0, 1
; CHECK64-NEXT:    slli a0, a0, 31
; CHECK64-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    lui a0, 524288
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 4 x i32> @llvm.fptosi.sat.nxv4f16.nxv4i32(<vscale x 4 x half> %f)
    ret <vscale x 4 x i32> %x
}

define <vscale x 8 x i32> @test_signed_v8f16_v8i32(<vscale x 8 x half> %f) {
; CHECK32-LABEL: test_signed_v8f16_v8i32:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI16_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI16_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK32-NEXT:    vmfge.vf v10, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v10
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v12, v8
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    lui a1, %hi(.LCPI16_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI16_1)(a1)
; CHECK32-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK32-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK32-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK32-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK32-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v8f16_v8i32:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI16_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI16_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK64-NEXT:    vmfge.vf v10, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v10
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v12, v8
; CHECK64-NEXT:    lui a0, %hi(.LCPI16_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI16_1)(a0)
; CHECK64-NEXT:    li a0, 1
; CHECK64-NEXT:    slli a0, a0, 31
; CHECK64-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK64-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    lui a0, 524288
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK64-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 8 x i32> @llvm.fptosi.sat.nxv8f16.nxv8i32(<vscale x 8 x half> %f)
    ret <vscale x 8 x i32> %x
}

define <vscale x 4 x i16> @test_signed_v4f16_v4i16(<vscale x 4 x half> %f) {
; CHECK32-LABEL: test_signed_v4f16_v4i16:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI17_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI17_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    lui a0, %hi(.LCPI17_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI17_1)(a0)
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v9, v8
; CHECK32-NEXT:    lui a0, 8
; CHECK32-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vmfne.vv v8, v8, v8
; CHECK32-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK32-NEXT:    vmv.v.v v0, v8
; CHECK32-NEXT:    vmerge.vim v8, v9, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v4f16_v4i16:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI17_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI17_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    lui a0, %hi(.LCPI17_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI17_1)(a0)
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v9, v8
; CHECK64-NEXT:    lui a0, 8
; CHECK64-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vmfne.vv v8, v8, v8
; CHECK64-NEXT:    vmerge.vxm v9, v9, a0, v0
; CHECK64-NEXT:    vmv.v.v v0, v8
; CHECK64-NEXT:    vmerge.vim v8, v9, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 4 x i16> @llvm.fptosi.sat.nxv4f16.nxv4i16(<vscale x 4 x half> %f)
    ret <vscale x 4 x i16> %x
}

define <vscale x 8 x i16> @test_signed_v8f16_v8i16(<vscale x 8 x half> %f) {
; CHECK32-LABEL: test_signed_v8f16_v8i16:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    lui a0, %hi(.LCPI18_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI18_0)(a0)
; CHECK32-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK32-NEXT:    vmfge.vf v10, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v10
; CHECK32-NEXT:    lui a0, %hi(.LCPI18_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI18_1)(a0)
; CHECK32-NEXT:    vfcvt.rtz.x.f.v v10, v8
; CHECK32-NEXT:    lui a0, 8
; CHECK32-NEXT:    vmerge.vxm v12, v10, a0, v0
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    vmfne.vv v10, v8, v8
; CHECK32-NEXT:    vmerge.vxm v8, v12, a0, v0
; CHECK32-NEXT:    vmv1r.v v0, v10
; CHECK32-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v8f16_v8i16:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI18_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI18_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK64-NEXT:    vmfge.vf v10, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v10
; CHECK64-NEXT:    lui a0, %hi(.LCPI18_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI18_1)(a0)
; CHECK64-NEXT:    vfcvt.rtz.x.f.v v10, v8
; CHECK64-NEXT:    lui a0, 8
; CHECK64-NEXT:    vmerge.vxm v12, v10, a0, v0
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    addiw a0, a0, -1
; CHECK64-NEXT:    vmfne.vv v10, v8, v8
; CHECK64-NEXT:    vmerge.vxm v8, v12, a0, v0
; CHECK64-NEXT:    vmv1r.v v0, v10
; CHECK64-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 8 x i16> @llvm.fptosi.sat.nxv8f16.nxv8i16(<vscale x 8 x half> %f)
    ret <vscale x 8 x i16> %x
}

define <vscale x 2 x i64> @test_signed_v2f16_v2i64(<vscale x 2 x half> %f) {
; CHECK32-LABEL: test_signed_v2f16_v2i64:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    addi sp, sp, -16
; CHECK32-NEXT:    .cfi_def_cfa_offset 16
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    sw zero, 8(sp)
; CHECK32-NEXT:    li a1, -1
; CHECK32-NEXT:    sw a1, 8(sp)
; CHECK32-NEXT:    lui a1, %hi(.LCPI19_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI19_0)(a1)
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    vfwcvt.f.f.v v9, v8
; CHECK32-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v10, v9
; CHECK32-NEXT:    lui a0, %hi(.LCPI19_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI19_1)(a0)
; CHECK32-NEXT:    addi a0, sp, 8
; CHECK32-NEXT:    vlse64.v v10, (a0), zero, v0.t
; CHECK32-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    vlse64.v v10, (a0), zero, v0.t
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK32-NEXT:    addi sp, sp, 16
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v2f16_v2i64:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI19_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI19_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    vfwcvt.f.f.v v9, v8
; CHECK64-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v10, v9
; CHECK64-NEXT:    li a0, -1
; CHECK64-NEXT:    lui a1, %hi(.LCPI19_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI19_1)(a1)
; CHECK64-NEXT:    slli a1, a0, 63
; CHECK64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmerge.vxm v10, v10, a1, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    srli a0, a0, 1
; CHECK64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v10, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 2 x i64> @llvm.fptosi.sat.nxv2f16.nxv2i64(<vscale x 2 x half> %f)
    ret <vscale x 2 x i64> %x
}

define <vscale x 4 x i64> @test_signed_v4f16_v4i64(<vscale x 4 x half> %f) {
; CHECK32-LABEL: test_signed_v4f16_v4i64:
; CHECK32:       # %bb.0:
; CHECK32-NEXT:    addi sp, sp, -16
; CHECK32-NEXT:    .cfi_def_cfa_offset 16
; CHECK32-NEXT:    lui a0, 524288
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    sw zero, 8(sp)
; CHECK32-NEXT:    li a1, -1
; CHECK32-NEXT:    sw a1, 8(sp)
; CHECK32-NEXT:    lui a1, %hi(.LCPI20_0)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI20_0)(a1)
; CHECK32-NEXT:    addi a0, a0, -1
; CHECK32-NEXT:    sw a0, 12(sp)
; CHECK32-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK32-NEXT:    vmfge.vf v9, v8, ft0
; CHECK32-NEXT:    vmnot.m v0, v9
; CHECK32-NEXT:    vfwcvt.f.f.v v10, v8
; CHECK32-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK32-NEXT:    vfwcvt.rtz.x.f.v v12, v10
; CHECK32-NEXT:    lui a0, %hi(.LCPI20_1)
; CHECK32-NEXT:    flh ft0, %lo(.LCPI20_1)(a0)
; CHECK32-NEXT:    addi a0, sp, 8
; CHECK32-NEXT:    vlse64.v v12, (a0), zero, v0.t
; CHECK32-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK32-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK32-NEXT:    vlse64.v v12, (a0), zero, v0.t
; CHECK32-NEXT:    vmfne.vv v0, v8, v8
; CHECK32-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK32-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK32-NEXT:    addi sp, sp, 16
; CHECK32-NEXT:    ret
;
; CHECK64-LABEL: test_signed_v4f16_v4i64:
; CHECK64:       # %bb.0:
; CHECK64-NEXT:    lui a0, %hi(.LCPI20_0)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI20_0)(a0)
; CHECK64-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfge.vf v9, v8, ft0
; CHECK64-NEXT:    vmnot.m v0, v9
; CHECK64-NEXT:    vfwcvt.f.f.v v10, v8
; CHECK64-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK64-NEXT:    vfwcvt.rtz.x.f.v v12, v10
; CHECK64-NEXT:    li a0, -1
; CHECK64-NEXT:    lui a1, %hi(.LCPI20_1)
; CHECK64-NEXT:    flh ft0, %lo(.LCPI20_1)(a1)
; CHECK64-NEXT:    slli a1, a0, 63
; CHECK64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmerge.vxm v12, v12, a1, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfgt.vf v0, v8, ft0
; CHECK64-NEXT:    srli a0, a0, 1
; CHECK64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK64-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK64-NEXT:    vmfne.vv v0, v8, v8
; CHECK64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK64-NEXT:    vmerge.vim v8, v12, 0, v0
; CHECK64-NEXT:    ret
    %x = call <vscale x 4 x i64> @llvm.fptosi.sat.nxv4f16.nxv4i64(<vscale x 4 x half> %f)
    ret <vscale x 4 x i64> %x
}

