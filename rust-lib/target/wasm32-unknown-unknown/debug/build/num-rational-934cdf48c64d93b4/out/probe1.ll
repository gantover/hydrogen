; ModuleID = 'probe1.dc4b56b82ca5e87d-cgu.0'
source_filename = "probe1.dc4b56b82ca5e87d-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

%"core::fmt::Arguments<'_>" = type { { ptr, i32 }, { ptr, i32 }, { ptr, i32 } }
%"alloc::string::String" = type { %"alloc::vec::Vec<u8>" }
%"alloc::vec::Vec<u8>" = type { { ptr, i32 }, i32 }
%"core::ptr::metadata::PtrRepr<[u8]>" = type { [2 x i32] }
%"alloc::alloc::Global" = type {}
%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>" = type { [1 x i32], i32, [1 x i32] }

@alloc_91c7fa63c3cfeaa3c795652d5cf060e4 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc_e90401c92a6af8b32765b1534130c461 = private unnamed_addr constant <{ ptr, [4 x i8] }> <{ ptr @alloc_91c7fa63c3cfeaa3c795652d5cf060e4, [4 x i8] c"\0C\00\00\00" }>, align 4
@alloc_c06a172a08ac35a48b6ad59116e021fc = private unnamed_addr constant <{}> zeroinitializer, align 4
@alloc_c6aa053330469dd17d77959e0ca34143 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/8771282d4e7a5c4569e49d1f878fb3ba90a974d0/library/core/src/fmt/mod.rs" }>, align 1
@alloc_580d436ef65559297003f2f15a454eb4 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_c6aa053330469dd17d77959e0ca34143, [12 x i8] c"K\00\00\005\01\00\00\0D\00\00\00" }>, align 4
@alloc_986a8b2fd89f758bc52e7a058cfac04c = private unnamed_addr constant <{ [80 x i8] }> <{ [80 x i8] c"/rustc/8771282d4e7a5c4569e49d1f878fb3ba90a974d0/library/core/src/alloc/layout.rs" }>, align 1
@alloc_5c4a019de1846ffbb649142ad73dfbad = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_986a8b2fd89f758bc52e7a058cfac04c, [12 x i8] c"P\00\00\00\BF\01\00\00)\00\00\00" }>, align 4
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"
@__rust_no_alloc_shim_is_unstable = external dso_local global i8
@alloc_97350e8bf483c1fe1c3a218b02d80fb1 = private unnamed_addr constant <{ ptr, [4 x i8] }> <{ ptr @alloc_c06a172a08ac35a48b6ad59116e021fc, [4 x i8] zeroinitializer }>, align 4
@alloc_83ea17bf0c4f4a5a5a13d3ae7955acd0 = private unnamed_addr constant <{ [4 x i8] }> zeroinitializer, align 4

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint nounwind
define internal void @_ZN4core3fmt9Arguments6new_v117h4658e32945c70cb2E(ptr sret(%"core::fmt::Arguments<'_>") align 4 %_0, ptr align 4 %pieces.0, i32 %pieces.1, ptr align 4 %args.0, i32 %args.1) unnamed_addr #0 {
start:
  %_16 = alloca { ptr, i32 }, align 4
  %_14 = alloca { ptr, i32 }, align 4
  %_12 = alloca %"core::fmt::Arguments<'_>", align 4
  %_3 = alloca i8, align 1
  %_4 = icmp ult i32 %pieces.1, %args.1
  br i1 %_4, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_9 = add i32 %args.1, 1
  %_7 = icmp ugt i32 %pieces.1, %_9
  %0 = zext i1 %_7 to i8
  store i8 %0, ptr %_3, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, ptr %_3, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %1 = load i8, ptr %_3, align 1, !range !1, !noundef !2
  %2 = trunc i8 %1 to i1
  br i1 %2, label %bb4, label %bb5

bb5:                                              ; preds = %bb3
  store ptr null, ptr %_14, align 4
  %3 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %pieces.0, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %pieces.1, ptr %4, align 4
  %5 = getelementptr inbounds { ptr, i32 }, ptr %_14, i32 0, i32 0
  %6 = load ptr, ptr %5, align 4, !align !3, !noundef !2
  %7 = getelementptr inbounds { ptr, i32 }, ptr %_14, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 2
  %10 = getelementptr inbounds { ptr, i32 }, ptr %9, i32 0, i32 0
  store ptr %6, ptr %10, align 4
  %11 = getelementptr inbounds { ptr, i32 }, ptr %9, i32 0, i32 1
  store i32 %8, ptr %11, align 4
  %12 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 1
  %13 = getelementptr inbounds { ptr, i32 }, ptr %12, i32 0, i32 0
  store ptr %args.0, ptr %13, align 4
  %14 = getelementptr inbounds { ptr, i32 }, ptr %12, i32 0, i32 1
  store i32 %args.1, ptr %14, align 4
  ret void

bb4:                                              ; preds = %bb3
  store ptr null, ptr %_16, align 4
  %15 = getelementptr inbounds { ptr, i32 }, ptr %_12, i32 0, i32 0
  store ptr @alloc_e90401c92a6af8b32765b1534130c461, ptr %15, align 4
  %16 = getelementptr inbounds { ptr, i32 }, ptr %_12, i32 0, i32 1
  store i32 1, ptr %16, align 4
  %17 = getelementptr inbounds { ptr, i32 }, ptr %_16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 4, !align !3, !noundef !2
  %19 = getelementptr inbounds { ptr, i32 }, ptr %_16, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_12, i32 0, i32 2
  %22 = getelementptr inbounds { ptr, i32 }, ptr %21, i32 0, i32 0
  store ptr %18, ptr %22, align 4
  %23 = getelementptr inbounds { ptr, i32 }, ptr %21, i32 0, i32 1
  store i32 %20, ptr %23, align 4
  %24 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_12, i32 0, i32 1
  %25 = getelementptr inbounds { ptr, i32 }, ptr %24, i32 0, i32 0
  store ptr @alloc_c06a172a08ac35a48b6ad59116e021fc, ptr %25, align 4
  %26 = getelementptr inbounds { ptr, i32 }, ptr %24, i32 0, i32 1
  store i32 0, ptr %26, align 4
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h92e39e63ca4b2ca4E(ptr align 4 %_12, ptr align 4 @alloc_580d436ef65559297003f2f15a454eb4) #11
  unreachable
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nounwind
define internal void @_ZN4core3ops8function6FnOnce9call_once17hf34af81ded8e449eE(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %0, i32 %1) unnamed_addr #0 {
start:
  %_2 = alloca { ptr, i32 }, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  store ptr %0, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  %5 = load ptr, ptr %4, align 4, !nonnull !2, !align !4, !noundef !2
  %6 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  %7 = load i32, ptr %6, align 4, !noundef !2
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17ha6c108b3a384abf6E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %5, i32 %7) #12
  ret void
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: nounwind
define hidden void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h9e26db7ac55cefc5E"(ptr align 4 %_1) unnamed_addr #1 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h046c0b199c7355b1E"(ptr align 4 %_1) #12
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: nounwind
define hidden void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h046c0b199c7355b1E"(ptr align 4 %_1) unnamed_addr #1 {
start:
; call <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h93e8b336aac07852E"(ptr align 4 %_1) #12
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h80390994ff63e492E"(ptr align 4 %_1) #12
  ret void
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: nounwind
define hidden void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h80390994ff63e492E"(ptr align 4 %_1) unnamed_addr #1 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h81437edead2b0025E"(ptr align 4 %_1) #12
  ret void
}

; core::alloc::layout::Layout::array::inner
; Function Attrs: inlinehint nounwind
define internal { i32, i32 } @_ZN4core5alloc6layout6Layout5array5inner17hf455814f77975a70E(i32 %element_size, i32 %align, i32 %n) unnamed_addr #0 {
start:
  %_19 = alloca i32, align 4
  %_14 = alloca i32, align 4
  %_10 = alloca { i32, i32 }, align 4
  %_4 = alloca i8, align 1
  %_0 = alloca { i32, i32 }, align 4
  %0 = icmp eq i32 %element_size, 0
  br i1 %0, label %bb1, label %bb2

bb1:                                              ; preds = %start
  store i8 0, ptr %_4, align 1
  br label %bb3

bb2:                                              ; preds = %start
  store i32 %align, ptr %_14, align 4
  %_15 = load i32, ptr %_14, align 4, !range !5, !noundef !2
  %_16 = icmp uge i32 %_15, 1
  %_17 = icmp ule i32 %_15, -2147483648
  %_18 = and i1 %_16, %_17
  call void @llvm.assume(i1 %_18)
  %_12 = sub i32 %_15, 1
  %_7 = sub i32 2147483647, %_12
  %_8 = icmp eq i32 %element_size, 0
  %1 = call i1 @llvm.expect.i1(i1 %_8, i1 false)
  br i1 %1, label %panic, label %bb4

bb3:                                              ; preds = %bb4, %bb1
  %2 = load i8, ptr %_4, align 1, !range !1, !noundef !2
  %3 = trunc i8 %2 to i1
  br i1 %3, label %bb5, label %bb6

bb4:                                              ; preds = %bb2
  %_6 = udiv i32 %_7, %element_size
  %_5 = icmp ugt i32 %n, %_6
  %4 = zext i1 %_5 to i8
  store i8 %4, ptr %_4, align 1
  br label %bb3

panic:                                            ; preds = %bb2
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17hc48e6bea417c8a29E(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_5c4a019de1846ffbb649142ad73dfbad) #11
  unreachable

bb6:                                              ; preds = %bb3
  %array_size = mul i32 %element_size, %n
  store i32 %align, ptr %_19, align 4
  %_20 = load i32, ptr %_19, align 4, !range !5, !noundef !2
  %_21 = icmp uge i32 %_20, 1
  %_22 = icmp ule i32 %_20, -2147483648
  %_23 = and i1 %_21, %_22
  call void @llvm.assume(i1 %_23)
  %5 = getelementptr inbounds { i32, i32 }, ptr %_10, i32 0, i32 1
  store i32 %array_size, ptr %5, align 4
  store i32 %_20, ptr %_10, align 4
  %6 = getelementptr inbounds { i32, i32 }, ptr %_10, i32 0, i32 0
  %7 = load i32, ptr %6, align 4, !range !5, !noundef !2
  %8 = getelementptr inbounds { i32, i32 }, ptr %_10, i32 0, i32 1
  %9 = load i32, ptr %8, align 4, !noundef !2
  %10 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 0
  store i32 %7, ptr %10, align 4
  %11 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 1
  store i32 %9, ptr %11, align 4
  br label %bb7

bb5:                                              ; preds = %bb3
  store i32 0, ptr %_0, align 4
  br label %bb7

bb7:                                              ; preds = %bb5, %bb6
  %12 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 0
  %13 = load i32, ptr %12, align 4, !range !6, !noundef !2
  %14 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = insertvalue { i32, i32 } poison, i32 %13, 0
  %17 = insertvalue { i32, i32 } %16, i32 %15, 1
  ret { i32, i32 } %17
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint nounwind
define hidden void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h8e0c2ddfc8e526e3E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %0, i32 %1, ptr align 4 %default) unnamed_addr #0 {
start:
  %_10 = alloca i8, align 1
  %_9 = alloca i8, align 1
  %_7 = alloca { ptr, i32 }, align 4
  %self = alloca { ptr, i32 }, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 0
  store ptr %0, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  store i32 %1, ptr %3, align 4
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %4 = load ptr, ptr %self, align 4, !noundef !2
  %5 = ptrtoint ptr %4 to i32
  %6 = icmp eq i32 %5, 0
  %_4 = select i1 %6, i32 0, i32 1
  %7 = icmp eq i32 %_4, 0
  br i1 %7, label %bb1, label %bb3

bb1:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; call alloc::fmt::format::{{closure}}
  call void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h8fb2f67e9e9841a1E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %default) #12
  br label %bb9

bb3:                                              ; preds = %start
  %8 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 0
  %t.0 = load ptr, ptr %8, align 4, !nonnull !2, !align !4, !noundef !2
  %9 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  %t.1 = load i32, ptr %9, align 4, !noundef !2
  store i8 0, ptr %_9, align 1
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 0
  store ptr %t.0, ptr %10, align 4
  %11 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 1
  store i32 %t.1, ptr %11, align 4
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 0
  %13 = load ptr, ptr %12, align 4, !nonnull !2, !align !4, !noundef !2
  %14 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 1
  %15 = load i32, ptr %14, align 4, !noundef !2
; call core::ops::function::FnOnce::call_once
  call void @_ZN4core3ops8function6FnOnce9call_once17hf34af81ded8e449eE(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %13, i32 %15) #12
  br label %bb9

bb9:                                              ; preds = %bb3, %bb1
  %16 = load i8, ptr %_9, align 1, !range !1, !noundef !2
  %17 = trunc i8 %16 to i1
  br i1 %17, label %bb8, label %bb6

bb6:                                              ; preds = %bb8, %bb9
  %18 = load i8, ptr %_10, align 1, !range !1, !noundef !2
  %19 = trunc i8 %18 to i1
  br i1 %19, label %bb10, label %bb7

bb8:                                              ; preds = %bb9
  br label %bb6

bb7:                                              ; preds = %bb10, %bb6
  ret void

bb10:                                             ; preds = %bb6
  br label %bb7

bb2:                                              ; No predecessors!
  unreachable
}

; alloc::fmt::format
; Function Attrs: inlinehint nounwind
define internal void @_ZN5alloc3fmt6format17hb4a7c252f74580d9E(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %args) unnamed_addr #0 {
start:
  %_3 = alloca ptr, align 4
  %_2 = alloca { ptr, i32 }, align 4
  %0 = getelementptr inbounds { ptr, i32 }, ptr %args, i32 0, i32 0
  %_5.0 = load ptr, ptr %0, align 4, !nonnull !2, !align !3, !noundef !2
  %1 = getelementptr inbounds { ptr, i32 }, ptr %args, i32 0, i32 1
  %_5.1 = load i32, ptr %1, align 4, !noundef !2
  %2 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %args, i32 0, i32 1
  %3 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 0
  %_6.0 = load ptr, ptr %3, align 4, !nonnull !2, !align !3, !noundef !2
  %4 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 1
  %_6.1 = load i32, ptr %4, align 4, !noundef !2
  %5 = icmp eq i32 %_5.1, 0
  br i1 %5, label %bb3, label %bb5

bb3:                                              ; preds = %start
  %6 = icmp eq i32 %_6.1, 0
  br i1 %6, label %bb7, label %bb4

bb5:                                              ; preds = %start
  %7 = icmp eq i32 %_5.1, 1
  br i1 %7, label %bb6, label %bb4

bb7:                                              ; preds = %bb3
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  store ptr @alloc_c06a172a08ac35a48b6ad59116e021fc, ptr %8, align 4
  %9 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  store i32 0, ptr %9, align 4
  br label %bb1

bb4:                                              ; preds = %bb6, %bb5, %bb3
  store ptr null, ptr %_2, align 4
  br label %bb1

bb1:                                              ; preds = %bb4, %bb8, %bb7
  store ptr %args, ptr %_3, align 4
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  %11 = load ptr, ptr %10, align 4, !align !4, !noundef !2
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %_3, align 4, !nonnull !2, !align !3, !noundef !2
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h8e0c2ddfc8e526e3E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %11, i32 %13, ptr align 4 %14) #12
  ret void

bb6:                                              ; preds = %bb5
  %15 = icmp eq i32 %_6.1, 0
  br i1 %15, label %bb8, label %bb4

bb8:                                              ; preds = %bb6
  %16 = getelementptr inbounds [0 x { ptr, i32 }], ptr %_5.0, i32 0, i32 0
  %17 = getelementptr inbounds { ptr, i32 }, ptr %16, i32 0, i32 0
  %_12.0 = load ptr, ptr %17, align 4, !nonnull !2, !align !4, !noundef !2
  %18 = getelementptr inbounds { ptr, i32 }, ptr %16, i32 0, i32 1
  %_12.1 = load i32, ptr %18, align 4, !noundef !2
  %19 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  store ptr %_12.0, ptr %19, align 4
  %20 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  store i32 %_12.1, ptr %20, align 4
  br label %bb1
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint nounwind
define hidden void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h8fb2f67e9e9841a1E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %0) unnamed_addr #0 {
start:
  %_2 = alloca %"core::fmt::Arguments<'_>", align 4
  %_1 = alloca ptr, align 4
  store ptr %0, ptr %_1, align 4
  %_3 = load ptr, ptr %_1, align 4, !nonnull !2, !align !3, !noundef !2
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_2, ptr align 4 %_3, i32 24, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17hddc90772a9b56876E(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %_2) #12
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint nounwind
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17ha6c108b3a384abf6E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %self.0, i32 %self.1) unnamed_addr #0 {
start:
  %v = alloca %"alloc::vec::Vec<u8>", align 4
  %bytes = alloca %"alloc::vec::Vec<u8>", align 4
; call alloc::raw_vec::RawVec<T,A>::allocate_in
  %0 = call { ptr, i32 } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17haf006d835882b242E"(i32 %self.1, i1 zeroext false) #12
  %_10.0 = extractvalue { ptr, i32 } %0, 0
  %_10.1 = extractvalue { ptr, i32 } %0, 1
  %1 = getelementptr inbounds { ptr, i32 }, ptr %v, i32 0, i32 0
  store ptr %_10.0, ptr %1, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %v, i32 0, i32 1
  store i32 %_10.1, ptr %2, align 4
  %3 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i32 0, ptr %3, align 4
  %self = load ptr, ptr %v, align 4, !nonnull !2, !noundef !2
  %4 = mul i32 %self.1, 1
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %self, ptr align 1 %self.0, i32 %4, i1 false)
  %5 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i32 %self.1, ptr %5, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %bytes, ptr align 4 %v, i32 12, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_0, ptr align 4 %bytes, i32 12, i1 false)
  ret void
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint nounwind
define internal { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17hdd793f651529c32dE(ptr align 1 %self, i32 %layout.0, i32 %layout.1, i1 zeroext %zeroed) unnamed_addr #0 {
start:
  %0 = alloca i8, align 1
  %_65 = alloca { ptr, i32 }, align 4
  %_64 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %_51 = alloca ptr, align 4
  %_44 = alloca i32, align 4
  %_35 = alloca i32, align 4
  %_30 = alloca { ptr, i32 }, align 4
  %_29 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %_18 = alloca i32, align 4
  %_14 = alloca { ptr, i32 }, align 4
  %self2 = alloca ptr, align 4
  %self1 = alloca ptr, align 4
  %_8 = alloca ptr, align 4
  %raw_ptr = alloca ptr, align 4
  %data = alloca ptr, align 4
  %_5 = alloca { ptr, i32 }, align 4
  %_0 = alloca { ptr, i32 }, align 4
  %1 = icmp eq i32 %layout.1, 0
  br i1 %1, label %bb2, label %bb1

bb2:                                              ; preds = %start
  store i32 %layout.0, ptr %_18, align 4
  %_19 = load i32, ptr %_18, align 4, !range !5, !noundef !2
  %_20 = icmp uge i32 %_19, 1
  %_21 = icmp ule i32 %_19, -2147483648
  %_22 = and i1 %_20, %_21
  call void @llvm.assume(i1 %_22)
  %ptr = inttoptr i32 %_19 to ptr
  store ptr %ptr, ptr %data, align 4
  %_27 = load ptr, ptr %data, align 4, !noundef !2
  store ptr %_27, ptr %_30, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %_30, i32 0, i32 1
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, i32 }, ptr %_30, i32 0, i32 0
  %4 = load ptr, ptr %3, align 4, !noundef !2
  %5 = getelementptr inbounds { ptr, i32 }, ptr %_30, i32 0, i32 1
  %6 = load i32, ptr %5, align 4, !noundef !2
  %7 = getelementptr inbounds { ptr, i32 }, ptr %_29, i32 0, i32 0
  store ptr %4, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_29, i32 0, i32 1
  store i32 %6, ptr %8, align 4
  %9 = getelementptr inbounds { ptr, i32 }, ptr %_29, i32 0, i32 0
  %ptr.0 = load ptr, ptr %9, align 4, !noundef !2
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_29, i32 0, i32 1
  %ptr.1 = load i32, ptr %10, align 4, !noundef !2
  %11 = getelementptr inbounds { ptr, i32 }, ptr %_5, i32 0, i32 0
  store ptr %ptr.0, ptr %11, align 4
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_5, i32 0, i32 1
  store i32 %ptr.1, ptr %12, align 4
  %13 = getelementptr inbounds { ptr, i32 }, ptr %_5, i32 0, i32 0
  %14 = load ptr, ptr %13, align 4, !nonnull !2, !noundef !2
  %15 = getelementptr inbounds { ptr, i32 }, ptr %_5, i32 0, i32 1
  %16 = load i32, ptr %15, align 4, !noundef !2
  %17 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %14, ptr %17, align 4
  %18 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %16, ptr %18, align 4
  br label %bb10

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb3, label %bb4

bb10:                                             ; preds = %bb9, %bb7, %bb2
  %19 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  %20 = load ptr, ptr %19, align 4, !noundef !2
  %21 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = insertvalue { ptr, i32 } poison, ptr %20, 0
  %24 = insertvalue { ptr, i32 } %23, i32 %22, 1
  ret { ptr, i32 } %24

bb4:                                              ; preds = %bb1
  %25 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %25, ptr %0, align 1
  %_40 = load i8, ptr %0, align 1, !noundef !2
  store i32 %layout.0, ptr %_44, align 4
  %_45 = load i32, ptr %_44, align 4, !range !5, !noundef !2
  %_46 = icmp uge i32 %_45, 1
  %_47 = icmp ule i32 %_45, -2147483648
  %_48 = and i1 %_46, %_47
  call void @llvm.assume(i1 %_48)
  %26 = call ptr @__rust_alloc(i32 %layout.1, i32 %_45) #12
  store ptr %26, ptr %raw_ptr, align 4
  br label %bb5

bb3:                                              ; preds = %bb1
  store i32 %layout.0, ptr %_35, align 4
  %_36 = load i32, ptr %_35, align 4, !range !5, !noundef !2
  %_37 = icmp uge i32 %_36, 1
  %_38 = icmp ule i32 %_36, -2147483648
  %_39 = and i1 %_37, %_38
  call void @llvm.assume(i1 %_39)
  %27 = call ptr @__rust_alloc_zeroed(i32 %layout.1, i32 %_36) #12
  store ptr %27, ptr %raw_ptr, align 4
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  %ptr3 = load ptr, ptr %raw_ptr, align 4, !noundef !2
  %_52 = ptrtoint ptr %ptr3 to i32
  %_50 = icmp eq i32 %_52, 0
  %_49 = xor i1 %_50, true
  br i1 %_49, label %bb14, label %bb15

bb15:                                             ; preds = %bb5
  store ptr null, ptr %self2, align 4
  br label %bb16

bb14:                                             ; preds = %bb5
  store ptr %ptr3, ptr %_51, align 4
  %28 = load ptr, ptr %_51, align 4, !nonnull !2, !noundef !2
  store ptr %28, ptr %self2, align 4
  br label %bb16

bb16:                                             ; preds = %bb14, %bb15
  %29 = load ptr, ptr %self2, align 4, !noundef !2
  %30 = ptrtoint ptr %29 to i32
  %31 = icmp eq i32 %30, 0
  %_56 = select i1 %31, i32 0, i32 1
  %32 = icmp eq i32 %_56, 0
  br i1 %32, label %bb17, label %bb18

bb17:                                             ; preds = %bb16
  store ptr null, ptr %self1, align 4
  br label %bb19

bb18:                                             ; preds = %bb16
  %v = load ptr, ptr %self2, align 4, !nonnull !2, !noundef !2
  store ptr %v, ptr %self1, align 4
  br label %bb19

bb19:                                             ; preds = %bb18, %bb17
  %33 = load ptr, ptr %self1, align 4, !noundef !2
  %34 = ptrtoint ptr %33 to i32
  %35 = icmp eq i32 %34, 0
  %_58 = select i1 %35, i32 1, i32 0
  %36 = icmp eq i32 %_58, 0
  br i1 %36, label %bb21, label %bb20

bb21:                                             ; preds = %bb19
  %v4 = load ptr, ptr %self1, align 4, !nonnull !2, !noundef !2
  store ptr %v4, ptr %_8, align 4
  br label %bb6

bb20:                                             ; preds = %bb19
  store ptr null, ptr %_8, align 4
  br label %bb6

bb6:                                              ; preds = %bb20, %bb21
  %37 = load ptr, ptr %_8, align 4, !noundef !2
  %38 = ptrtoint ptr %37 to i32
  %39 = icmp eq i32 %38, 0
  %_12 = select i1 %39, i32 1, i32 0
  %40 = icmp eq i32 %_12, 0
  br i1 %40, label %bb7, label %bb9

bb7:                                              ; preds = %bb6
  %ptr5 = load ptr, ptr %_8, align 4, !nonnull !2, !noundef !2
  store ptr %ptr5, ptr %_65, align 4
  %41 = getelementptr inbounds { ptr, i32 }, ptr %_65, i32 0, i32 1
  store i32 %layout.1, ptr %41, align 4
  %42 = getelementptr inbounds { ptr, i32 }, ptr %_65, i32 0, i32 0
  %43 = load ptr, ptr %42, align 4, !noundef !2
  %44 = getelementptr inbounds { ptr, i32 }, ptr %_65, i32 0, i32 1
  %45 = load i32, ptr %44, align 4, !noundef !2
  %46 = getelementptr inbounds { ptr, i32 }, ptr %_64, i32 0, i32 0
  store ptr %43, ptr %46, align 4
  %47 = getelementptr inbounds { ptr, i32 }, ptr %_64, i32 0, i32 1
  store i32 %45, ptr %47, align 4
  %48 = getelementptr inbounds { ptr, i32 }, ptr %_64, i32 0, i32 0
  %ptr.06 = load ptr, ptr %48, align 4, !noundef !2
  %49 = getelementptr inbounds { ptr, i32 }, ptr %_64, i32 0, i32 1
  %ptr.17 = load i32, ptr %49, align 4, !noundef !2
  %50 = getelementptr inbounds { ptr, i32 }, ptr %_14, i32 0, i32 0
  store ptr %ptr.06, ptr %50, align 4
  %51 = getelementptr inbounds { ptr, i32 }, ptr %_14, i32 0, i32 1
  store i32 %ptr.17, ptr %51, align 4
  %52 = getelementptr inbounds { ptr, i32 }, ptr %_14, i32 0, i32 0
  %53 = load ptr, ptr %52, align 4, !nonnull !2, !noundef !2
  %54 = getelementptr inbounds { ptr, i32 }, ptr %_14, i32 0, i32 1
  %55 = load i32, ptr %54, align 4, !noundef !2
  %56 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %53, ptr %56, align 4
  %57 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %55, ptr %57, align 4
  br label %bb10

bb9:                                              ; preds = %bb6
  store ptr null, ptr %_0, align 4
  br label %bb10

bb8:                                              ; No predecessors!
  unreachable
}

; alloc::raw_vec::RawVec<T,A>::allocate_in
; Function Attrs: nounwind
define hidden { ptr, i32 } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17haf006d835882b242E"(i32 %capacity, i1 zeroext %0) unnamed_addr #1 {
start:
  %_44 = alloca ptr, align 4
  %self1 = alloca { i32, i32 }, align 4
  %_36 = alloca { i32, i32 }, align 4
  %_27 = alloca ptr, align 4
  %_26 = alloca ptr, align 4
  %self = alloca ptr, align 4
  %_22 = alloca ptr, align 4
  %result = alloca { ptr, i32 }, align 4
  %_11 = alloca { i32, i32 }, align 4
  %_7 = alloca { i32, i32 }, align 4
  %_4 = alloca i8, align 1
  %_0 = alloca { ptr, i32 }, align 4
  %alloc = alloca %"alloc::alloc::Global", align 1
  %init = alloca i8, align 1
  %1 = zext i1 %0 to i8
  store i8 %1, ptr %init, align 1
  br i1 false, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_5 = icmp eq i32 %capacity, 0
  %2 = zext i1 %_5 to i8
  store i8 %2, ptr %_4, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, ptr %_4, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %3 = load i8, ptr %_4, align 1, !range !1, !noundef !2
  %4 = trunc i8 %3 to i1
  br i1 %4, label %bb4, label %bb5

bb5:                                              ; preds = %bb3
; call core::alloc::layout::Layout::array::inner
  %5 = call { i32, i32 } @_ZN4core5alloc6layout6Layout5array5inner17hf455814f77975a70E(i32 1, i32 1, i32 %capacity) #12
  store { i32, i32 } %5, ptr %_7, align 4
  %6 = load i32, ptr %_7, align 4, !range !6, !noundef !2
  %7 = icmp eq i32 %6, 0
  %_8 = select i1 %7, i32 1, i32 0
  %8 = icmp eq i32 %_8, 0
  br i1 %8, label %bb8, label %bb6

bb4:                                              ; preds = %bb3
  store ptr inttoptr (i32 1 to ptr), ptr %_27, align 4
  %9 = load ptr, ptr %_27, align 4, !nonnull !2, !noundef !2
  store ptr %9, ptr %_26, align 4
  %10 = load ptr, ptr %_26, align 4, !nonnull !2, !noundef !2
  store ptr %10, ptr %_0, align 4
  %11 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 0, ptr %11, align 4
  br label %bb18

bb8:                                              ; preds = %bb5
  %12 = getelementptr inbounds { i32, i32 }, ptr %_7, i32 0, i32 0
  %layout.0 = load i32, ptr %12, align 4, !range !5, !noundef !2
  %13 = getelementptr inbounds { i32, i32 }, ptr %_7, i32 0, i32 1
  %layout.1 = load i32, ptr %13, align 4, !noundef !2
  %_35 = icmp ugt i32 %layout.1, 2147483647
  br i1 %_35, label %bb20, label %bb21

bb6:                                              ; preds = %bb5
; call alloc::raw_vec::capacity_overflow
  call void @_ZN5alloc7raw_vec17capacity_overflow17he17f7df2cab81f75E() #11
  unreachable

bb21:                                             ; preds = %bb8
  store i32 -2147483647, ptr %_11, align 4
  br label %bb22

bb20:                                             ; preds = %bb8
  store i32 0, ptr %self1, align 4
  %14 = getelementptr inbounds { i32, i32 }, ptr %self1, i32 0, i32 0
  %15 = load i32, ptr %14, align 4, !range !6, !noundef !2
  %16 = getelementptr inbounds { i32, i32 }, ptr %self1, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr inbounds { i32, i32 }, ptr %_36, i32 0, i32 0
  store i32 %15, ptr %18, align 4
  %19 = getelementptr inbounds { i32, i32 }, ptr %_36, i32 0, i32 1
  store i32 %17, ptr %19, align 4
  %20 = getelementptr inbounds { i32, i32 }, ptr %_36, i32 0, i32 0
  %21 = load i32, ptr %20, align 4, !range !6, !noundef !2
  %22 = getelementptr inbounds { i32, i32 }, ptr %_36, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr inbounds { i32, i32 }, ptr %_11, i32 0, i32 0
  store i32 %21, ptr %24, align 4
  %25 = getelementptr inbounds { i32, i32 }, ptr %_11, i32 0, i32 1
  store i32 %23, ptr %25, align 4
  br label %bb22

bb22:                                             ; preds = %bb20, %bb21
  %26 = load i32, ptr %_11, align 4, !range !7, !noundef !2
  %27 = icmp eq i32 %26, -2147483647
  %_13 = select i1 %27, i32 0, i32 1
  %28 = icmp eq i32 %_13, 0
  br i1 %28, label %bb10, label %bb9

bb10:                                             ; preds = %bb22
  %29 = load i8, ptr %init, align 1, !range !1, !noundef !2
  %30 = trunc i8 %29 to i1
  %_16 = zext i1 %30 to i32
  %31 = icmp eq i32 %_16, 0
  br i1 %31, label %bb12, label %bb11

bb9:                                              ; preds = %bb22
; call alloc::raw_vec::capacity_overflow
  call void @_ZN5alloc7raw_vec17capacity_overflow17he17f7df2cab81f75E() #11
  unreachable

bb12:                                             ; preds = %bb10
; call <alloc::alloc::Global as core::alloc::Allocator>::allocate
  %32 = call { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h99a8731fac657463E"(ptr align 1 %alloc, i32 %layout.0, i32 %layout.1) #12
  store { ptr, i32 } %32, ptr %result, align 4
  br label %bb15

bb11:                                             ; preds = %bb10
; call <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
  %33 = call { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h40e1725a887f7855E"(ptr align 1 %alloc, i32 %layout.0, i32 %layout.1) #12
  store { ptr, i32 } %33, ptr %result, align 4
  br label %bb15

bb15:                                             ; preds = %bb11, %bb12
  %34 = load ptr, ptr %result, align 4, !noundef !2
  %35 = ptrtoint ptr %34 to i32
  %36 = icmp eq i32 %35, 0
  %_19 = select i1 %36, i32 1, i32 0
  %37 = icmp eq i32 %_19, 0
  br i1 %37, label %bb17, label %bb16

bb17:                                             ; preds = %bb15
  %38 = getelementptr inbounds { ptr, i32 }, ptr %result, i32 0, i32 0
  %ptr.0 = load ptr, ptr %38, align 4, !nonnull !2, !noundef !2
  %39 = getelementptr inbounds { ptr, i32 }, ptr %result, i32 0, i32 1
  %ptr.1 = load i32, ptr %39, align 4, !noundef !2
  store ptr %ptr.0, ptr %self, align 4
  %_43 = load ptr, ptr %self, align 4, !noundef !2
  store ptr %_43, ptr %_44, align 4
  %40 = load ptr, ptr %_44, align 4, !nonnull !2, !noundef !2
  store ptr %40, ptr %_22, align 4
  %41 = load ptr, ptr %_22, align 4, !nonnull !2, !noundef !2
  store ptr %41, ptr %_0, align 4
  %42 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %capacity, ptr %42, align 4
  br label %bb18

bb16:                                             ; preds = %bb15
; call alloc::alloc::handle_alloc_error
  call void @_ZN5alloc5alloc18handle_alloc_error17hcd5b68591bb2a07cE(i32 %layout.0, i32 %layout.1) #11
  unreachable

bb18:                                             ; preds = %bb4, %bb17
  %43 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  %44 = load ptr, ptr %43, align 4, !nonnull !2, !noundef !2
  %45 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  %46 = load i32, ptr %45, align 4, !noundef !2
  %47 = insertvalue { ptr, i32 } poison, ptr %44, 0
  %48 = insertvalue { ptr, i32 } %47, i32 %46, 1
  ret { ptr, i32 } %48

bb7:                                              ; No predecessors!
  unreachable
}

; alloc::raw_vec::RawVec<T,A>::current_memory
; Function Attrs: nounwind
define hidden void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h49bbf9fe1820b1eeE"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 4 %_0, ptr align 4 %self) unnamed_addr #1 {
start:
  %self2 = alloca ptr, align 4
  %self1 = alloca ptr, align 4
  %_11 = alloca ptr, align 4
  %_10 = alloca { ptr, { i32, i32 } }, align 4
  %layout = alloca { i32, i32 }, align 4
  %_2 = alloca i8, align 1
  br i1 false, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %0 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  %_4 = load i32, ptr %0, align 4, !noundef !2
  %_3 = icmp eq i32 %_4, 0
  %1 = zext i1 %_3 to i8
  store i8 %1, ptr %_2, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, ptr %_2, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %2 = load i8, ptr %_2, align 1, !range !1, !noundef !2
  %3 = trunc i8 %2 to i1
  br i1 %3, label %bb4, label %bb5

bb5:                                              ; preds = %bb3
  %4 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  %rhs = load i32, ptr %4, align 4, !noundef !2
  %size = mul nuw i32 1, %rhs
  %5 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %size, ptr %5, align 4
  store i32 1, ptr %layout, align 4
  %self3 = load ptr, ptr %self, align 4, !nonnull !2, !noundef !2
  store ptr %self3, ptr %self1, align 4
  %_20 = load ptr, ptr %self1, align 4, !noundef !2
  store ptr %_20, ptr %self2, align 4
  %_25 = load ptr, ptr %self2, align 4, !noundef !2
  store ptr %_25, ptr %_11, align 4
  %6 = load ptr, ptr %_11, align 4, !nonnull !2, !noundef !2
  store ptr %6, ptr %_10, align 4
  %7 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %8 = load i32, ptr %7, align 4, !range !5, !noundef !2
  %9 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %10 = load i32, ptr %9, align 4, !noundef !2
  %11 = getelementptr inbounds { ptr, { i32, i32 } }, ptr %_10, i32 0, i32 1
  %12 = getelementptr inbounds { i32, i32 }, ptr %11, i32 0, i32 0
  store i32 %8, ptr %12, align 4
  %13 = getelementptr inbounds { i32, i32 }, ptr %11, i32 0, i32 1
  store i32 %10, ptr %13, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_0, ptr align 4 %_10, i32 12, i1 false)
  br label %bb6

bb4:                                              ; preds = %bb3
  %14 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_0, i32 0, i32 1
  store i32 0, ptr %14, align 4
  br label %bb6

bb6:                                              ; preds = %bb4, %bb5
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint nounwind
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h08bb2279311e9766E"(ptr align 1 %self, ptr %ptr, i32 %layout.0, i32 %layout.1) unnamed_addr #0 {
start:
  %_8 = alloca i32, align 4
  %0 = icmp eq i32 %layout.1, 0
  br i1 %0, label %bb2, label %bb1

bb2:                                              ; preds = %start
  br label %bb3

bb1:                                              ; preds = %start
  store i32 %layout.0, ptr %_8, align 4
  %_9 = load i32, ptr %_8, align 4, !range !5, !noundef !2
  %_10 = icmp uge i32 %_9, 1
  %_11 = icmp ule i32 %_9, -2147483648
  %_12 = and i1 %_10, %_11
  call void @llvm.assume(i1 %_12)
  call void @__rust_dealloc(ptr %ptr, i32 %layout.1, i32 %_9) #12
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
; Function Attrs: inlinehint nounwind
define internal { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h40e1725a887f7855E"(ptr align 1 %self, i32 %layout.0, i32 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17hdd793f651529c32dE(ptr align 1 %self, i32 %layout.0, i32 %layout.1, i1 zeroext true) #12
  %_0.0 = extractvalue { ptr, i32 } %0, 0
  %_0.1 = extractvalue { ptr, i32 } %0, 1
  %1 = insertvalue { ptr, i32 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i32 } %1, i32 %_0.1, 1
  ret { ptr, i32 } %2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate
; Function Attrs: inlinehint nounwind
define internal { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h99a8731fac657463E"(ptr align 1 %self, i32 %layout.0, i32 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17hdd793f651529c32dE(ptr align 1 %self, i32 %layout.0, i32 %layout.1, i1 zeroext false) #12
  %_0.0 = extractvalue { ptr, i32 } %0, 0
  %_0.1 = extractvalue { ptr, i32 } %0, 1
  %1 = insertvalue { ptr, i32 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i32 } %1, i32 %_0.1, 1
  ret { ptr, i32 } %2
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nounwind
define hidden void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h93e8b336aac07852E"(ptr align 4 %self) unnamed_addr #1 {
start:
  %_10 = alloca { ptr, i32 }, align 4
  %_9 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %self1 = load ptr, ptr %self, align 4, !nonnull !2, !noundef !2
  %0 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %self, i32 0, i32 1
  %len = load i32, ptr %0, align 4, !noundef !2
  store ptr %self1, ptr %_10, align 4
  %1 = getelementptr inbounds { ptr, i32 }, ptr %_10, i32 0, i32 1
  store i32 %len, ptr %1, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %_10, i32 0, i32 0
  %3 = load ptr, ptr %2, align 4, !noundef !2
  %4 = getelementptr inbounds { ptr, i32 }, ptr %_10, i32 0, i32 1
  %5 = load i32, ptr %4, align 4, !noundef !2
  %6 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 0
  store ptr %3, ptr %6, align 4
  %7 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 1
  store i32 %5, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 0
  %_2.0 = load ptr, ptr %8, align 4, !noundef !2
  %9 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 1
  %_2.1 = load i32, ptr %9, align 4, !noundef !2
  ret void
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nounwind
define hidden void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h81437edead2b0025E"(ptr align 4 %self) unnamed_addr #1 {
start:
  %_2 = alloca %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", align 4
; call alloc::raw_vec::RawVec<T,A>::current_memory
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h49bbf9fe1820b1eeE"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 4 %_2, ptr align 4 %self) #12
  %0 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_2, i32 0, i32 1
  %1 = load i32, ptr %0, align 4, !range !6, !noundef !2
  %2 = icmp eq i32 %1, 0
  %_4 = select i1 %2, i32 0, i32 1
  %3 = icmp eq i32 %_4, 1
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %start
  %ptr = load ptr, ptr %_2, align 4, !nonnull !2, !noundef !2
  %4 = getelementptr inbounds { ptr, { i32, i32 } }, ptr %_2, i32 0, i32 1
  %5 = getelementptr inbounds { i32, i32 }, ptr %4, i32 0, i32 0
  %layout.0 = load i32, ptr %5, align 4, !range !5, !noundef !2
  %6 = getelementptr inbounds { i32, i32 }, ptr %4, i32 0, i32 1
  %layout.1 = load i32, ptr %6, align 4, !noundef !2
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h08bb2279311e9766E"(ptr align 1 %self, ptr %ptr, i32 %layout.0, i32 %layout.1) #12
  br label %bb4

bb4:                                              ; preds = %bb2, %start
  ret void
}

; probe1::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe15probe17h7a74de1fff8667adE() unnamed_addr #1 {
start:
  %_0.i = alloca { ptr, ptr }, align 4
  %_7 = alloca [1 x { ptr, ptr }], align 4
  %_3 = alloca %"core::fmt::Arguments<'_>", align 4
  %res = alloca %"alloc::string::String", align 4
  %_1 = alloca %"alloc::string::String", align 4
  store ptr @alloc_83ea17bf0c4f4a5a5a13d3ae7955acd0, ptr %_0.i, align 4
  %0 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  store ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h7c5ea05b23f2e963E", ptr %0, align 4
  %1 = load ptr, ptr %_0.i, align 4, !nonnull !2, !align !4, !noundef !2
  %2 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  %3 = load ptr, ptr %2, align 4, !nonnull !2, !noundef !2
  %4 = insertvalue { ptr, ptr } poison, ptr %1, 0
  %5 = insertvalue { ptr, ptr } %4, ptr %3, 1
  %_8.0 = extractvalue { ptr, ptr } %5, 0
  %_8.1 = extractvalue { ptr, ptr } %5, 1
  %6 = getelementptr inbounds [1 x { ptr, ptr }], ptr %_7, i32 0, i32 0
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 0
  store ptr %_8.0, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 1
  store ptr %_8.1, ptr %8, align 4
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h4658e32945c70cb2E(ptr sret(%"core::fmt::Arguments<'_>") align 4 %_3, ptr align 4 @alloc_97350e8bf483c1fe1c3a218b02d80fb1, i32 1, ptr align 4 %_7, i32 1) #12
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17hb4a7c252f74580d9E(ptr sret(%"alloc::string::String") align 4 %res, ptr align 4 %_3) #12
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_1, ptr align 4 %res, i32 12, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h9e26db7ac55cefc5E"(ptr align 4 %_1) #12
  ret void
}

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: nounwind
declare dso_local zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h7c5ea05b23f2e963E"(ptr align 4, ptr align 4) unnamed_addr #1

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking9panic_fmt17h92e39e63ca4b2ca4E(ptr align 4, ptr align 4) unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare hidden void @llvm.assume(i1 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare hidden i1 @llvm.expect.i1(i1, i1) #4

; core::panicking::panic
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking5panic17hc48e6bea417c8a29E(ptr align 1, i32, ptr align 4) unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #5

; alloc::fmt::format::format_inner
; Function Attrs: nounwind
declare dso_local void @_ZN5alloc3fmt6format12format_inner17hddc90772a9b56876E(ptr sret(%"alloc::string::String") align 4, ptr align 4) unnamed_addr #1

; Function Attrs: nounwind allockind("alloc,uninitialized,aligned") allocsize(0)
declare dso_local noalias ptr @__rust_alloc(i32, i32 allocalign) unnamed_addr #6

; Function Attrs: nounwind allockind("alloc,zeroed,aligned") allocsize(0)
declare dso_local noalias ptr @__rust_alloc_zeroed(i32, i32 allocalign) unnamed_addr #7

; alloc::alloc::handle_alloc_error
; Function Attrs: cold noreturn nounwind
declare dso_local void @_ZN5alloc5alloc18handle_alloc_error17hcd5b68591bb2a07cE(i32, i32) unnamed_addr #8

; alloc::raw_vec::capacity_overflow
; Function Attrs: noreturn nounwind
declare dso_local void @_ZN5alloc7raw_vec17capacity_overflow17he17f7df2cab81f75E() unnamed_addr #9

; Function Attrs: nounwind allockind("free")
declare dso_local void @__rust_dealloc(ptr allocptr, i32, i32) unnamed_addr #10

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }
attributes #1 = { nounwind "target-cpu"="generic" }
attributes #2 = { cold noinline noreturn nounwind "target-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind allockind("alloc,uninitialized,aligned") allocsize(0) "alloc-family"="__rust_alloc" "target-cpu"="generic" }
attributes #7 = { nounwind allockind("alloc,zeroed,aligned") allocsize(0) "alloc-family"="__rust_alloc" "target-cpu"="generic" }
attributes #8 = { cold noreturn nounwind "target-cpu"="generic" }
attributes #9 = { noreturn nounwind "target-cpu"="generic" }
attributes #10 = { nounwind allockind("free") "alloc-family"="__rust_alloc" "target-cpu"="generic" }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.73.0-nightly (8771282d4 2023-07-23)"}
!1 = !{i8 0, i8 2}
!2 = !{}
!3 = !{i64 4}
!4 = !{i64 1}
!5 = !{i32 1, i32 -2147483647}
!6 = !{i32 0, i32 -2147483647}
!7 = !{i32 0, i32 -2147483646}
