@echo off

rem Set computer name
set /P PC_NAME=Desired computer name ^(Type input^):
reg add HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %PC_NAME% /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %PC_NAME% /f

net localgroup administrators n7wol@wwu.edu /add >nul 2>&1
if %errorlevel%==0 (
	echo n7wol was sucessfully added to Administrators
) else echo ^(User is already part of the group^)

echo.
echo Finished. Next step: Run "presetup_part2.vbs" to join WWU domain
echo Press any key to exit...
pause >nul