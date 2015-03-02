rem cmd

ECHO > "%TMP%\myregfile.reg" Windows Registry Editor Version 5.00

ECHO >> "%TMP%\myregfile.reg" [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp]
ECHO >> "%TMP%\myregfile.reg" "PortNumber"=dword:0000344d

regedit.exe /s %TMP%\myregfile.reg

netsh advfirewall firewall add rule name=myrule dir=in action=allow protocol=TCP localport=13389

net stop UmRdpService
net stop TermService
net start UmRdpService
net start TermService
