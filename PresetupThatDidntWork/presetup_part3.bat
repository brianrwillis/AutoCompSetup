@echo off
rem Enables network discovery 
echo Enabled network discovery

rem Enables file sharing
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v forceguest /t REG_DWORD /d 0 /f
echo Enabled file sharing

pause