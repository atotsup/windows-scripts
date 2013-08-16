@echo off
if "%1" == "" (
	echo %~n0 shows network connections by process name
	echo Usage: %~n0%~x0 ^<process-name.exe^>
	exit /b 1
)

for /f "tokens=2 delims= " %%a in ('tasklist ^| findstr /i %1') do (
	netstat -o -n | findstr /i %%a
)
