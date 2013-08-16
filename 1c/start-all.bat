@echo off
set a-test="e:\1cdatabases\a-test"
set h-test="e:\1cdatabases\h-test"

if "%1"=="atest" (set dbpath=%a-test% && goto next)
if "%1"=="htest" (set dbpath=%h-test% && goto next)

:exit
echo Usage: %~n0%~x0 ^<a^|h^>^<test^> [c]
exit /b 1

:next
if "%2"=="" (
	set args=%dbpath%
) else (
	set args=%dbpath%%2
)

start.bat %args%
