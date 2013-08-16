set force=-f
set timeout=-t 1
set runas=-u infocom\vg

set poweroff=-k
set reboot=-r
set action=%reboot%

psshutdown %force% %action% %runas% %timeout% \\prog20
