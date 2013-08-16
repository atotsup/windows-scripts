@echo off

REM “’ˆ Š €‡€Œ
set a-test="e:\1cdatabases\a-test" test acc
set h-test="e:\1cdatabases\h-test" test hrm

REM ‚‹…ˆŸ “•ƒ€‹’…ˆˆ
rem set acc1=2_0_37_8
rem set acc2=2_0_38_6
rem set acc3=2_0_39_6
rem set acc4=2_0_40_7
rem set acc5=2_0_42_5
rem set acc6=2_0_43_13
rem set acc7=2_0_44_13
rem set acc8=2_0_45_6
rem set acc9=2_0_46_5
rem set acc10=2_0_47_5
rem set acc11=2_0_47_9
rem set acc12=2_0_48_7
set acc13=2_0_49_15

REM ‚‹…ˆŸ ‡“
rem set hrm1=2_5_54_1
rem set hrm2=2_5_55_2
rem set hrm3=2_5_56_1
rem set hrm4=2_5_57_1
rem set hrm5=2_5_58_1
rem set hrm6=2_5_59_2
rem set hrm7=2_5_61_1
rem set hrm8=2_5_62_1
rem set hrm9=2_5_63_1
rem set hrm10=2_5_64_1
rem set hrm11=2_5_65_2
rem set hrm12=2_5_66_2
rem set hrm13=2_5_67_1
set hrm14=2_5_69_3

set acc=%acc13%
set hrm=%hrm14%

REM ==== ‚‹…ˆ… ˆ‡ „ˆ‘’ˆ“’ˆ‚€ ====
call update.bat %a-test% %acc%
call update.bat %h-test% %hrm%

REM ==== ˆŒ……ˆ… ‚‹…ˆŸ ‚ ‘‹“—€… …‘‹ˆ ›‹ˆ €Š’ˆ‚›… ‹œ‡‚€’…‹ˆ ====
call update.bat %a-test%
call update.bat %h-test%
