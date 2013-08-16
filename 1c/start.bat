set bin="C:\Program Files\1cv82\8.2.16.368\bin\1cv8.exe"
set dbuser=admin
set dbpass=somepass
set dbpath=%1

if "%2" == "" (
	set dbmode=ENTERPRISE
) else (
	if "%2" == "c" (
		set dbmode=CONFIG
	) else (
		exit /b 1
	)
)


@echo Starting 1C...
%bin% %dbmode% /F %dbpath% /N %dbuser% /P %dbpass%
