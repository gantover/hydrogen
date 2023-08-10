; ModuleID = 'probe4.15c64848c9138393-cgu.0'
source_filename = "probe4.15c64848c9138393-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

@alloc_af51538164a34f3a8a71368cd5a2e832 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/8771282d4e7a5c4569e49d1f878fb3ba90a974d0/library/core/src/num/mod.rs" }>, align 1
@alloc_d2d4194cee4874b02e7067ef0a1af346 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_af51538164a34f3a8a71368cd5a2e832, [12 x i8] c"K\00\00\00w\04\00\00\05\00\00\00" }>, align 4
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; probe4::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe45probe17h908ad5c73aaab13bE() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h82d465ebceac0fadE.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17hc48e6bea417c8a29E(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_d2d4194cee4874b02e7067ef0a1af346) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h82d465ebceac0fadE.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare hidden i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking5panic17hc48e6bea417c8a29E(ptr align 1, i32, ptr align 4) unnamed_addr #2

attributes #0 = { nounwind "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { cold noinline noreturn nounwind "target-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.73.0-nightly (8771282d4 2023-07-23)"}
