@echo off
rem Enables network discovery netsh advfirewall firewall set rule group="network discovery" new enable=yes
echo Enabled network discovery

rem Enables file sharing
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v forceguest /t REG_DWORD /d 0 /f
echo Enabled file sharing

pause