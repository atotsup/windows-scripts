@echo off
cd %~dp0
set runas=%username%
set program="%windir%\system32\notepad.exe"
set logfile="C:\Program Files (x86)\tools\run-in-session\log\log.txt"
set runner="C:\Program Files (x86)\tools\run-in-session\bin\psexec.exe"
for /f "tokens=3 delims= " %%a in ('query session^|findstr %runas%') do (
	if not "%%a" == "0" (
		echo %date% %time:~,-3% user=%runas% session=%%a process=%program% >> %logfile%
 		%runner% -i %%a %program%
	) else (
		echo %date% %time:~,-3% ERROR! No suitable session (current is 0) >> %logfile%
	)
)
