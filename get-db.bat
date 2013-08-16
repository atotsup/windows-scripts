@echo off
set host=host
set youzer=user
set password=password

set today=%date:~-4%-%date:~3,2%-%date:~0,2%

reg query HKCU\Software\SimonTatham\PuTTY\SshHostKeys /v rsa2@22:%host% > nul || reg import etc\cache.reg
bin\pscp -batch -pw %password% %youzer%@%host%:/usr/backups/transfer/*.dump . > log\%today%-dumps.txt
