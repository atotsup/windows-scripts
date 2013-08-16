@echo off

if "%1" == "" (
	echo Usage: %~n0%~x0 ^<file-with-list-of-hostnames.txt^>
	exit /b 1
) else (
	set fin=%1
)

set pingcmd=ping -n 1 -w 500

for /f "tokens=*" %%a in ('type %fin%') do for /f "tokens=7 delims= " %%b in ('%pingcmd% %%a ^| findstr TTL') do echo %%a
