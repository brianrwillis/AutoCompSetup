@echo off

:GivePermissions
	echo Giving user permissions...
	call "\\fm-mdtsrv\Software\AutoCompSetup\permissions.bat"
	
echo Scanning computer...
rem Find computer model
:FindModel
	wmic computersystem get model > tempfile
	more +1 tempfile > BIOSmodel
	set /p BIOSmodel= < BIOSmodel
	del tempfile
	del BIOSmodel
	set BIOSmodel=%BIOSmodel: =%
	echo System detected: %BIOSmodel%
	
rem Find computer's bios version
:FindBios
	wmic bios get smbiosbiosversion > tempfile
	more +1 tempfile > BIOSversion
	set /p BIOSversion= < BIOSversion
	del tempfile
	del BIOSversion
	set BIOSversion=%BIOSversion: =%
	echo BIOS version detected: %BIOSversion%

rem Find computer's video card model
:FindGPU
	for /f "tokens=2 delims==" %%f in ('wmic path Win32_VideoController get Name /value ^| find "="') do set "GPU_NAME=%%f"
	echo GPU model detected: %GPU_NAME%
	
:KillCortana
	echo Killing Cortana...
	reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" >nul 2>&1
	if %errorlevel%==0 (
		echo Cortana is already kill
	) else (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" >nul
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul
		echo Successfully killed Cortana
	)
	
:SystemPref
	rem Disable automatic restart after system failure
	reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v AutoReboot /t REG_DWORD /d 0 /f >nul
	echo Disabled automatic restart after system failure

	rem Set display of other operating systems on boot duration to 0 seconds
	bcdedit /timeout 0 >nul
	echo Set display of other operating systems on boot duration to 0 seconds

	rem Set max restore size to 10Gb
	vssadmin resize shadowstorage /on=c: /for=c: /maxsize=10GB >nul
	echo Set restore size to 10Gb

	rem Change virtual memory size to 18000Mb
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagingFiles" /t REG_MULTI_SZ /d "C:\pagefile.sys 18000 18000" /f >nul
	echo Set virtual memory size to 18Gb
	
	:Defrag
		rem Create defrag schedule for every day at midnight
		echo Overwrite current defrag schedule with daily defrag schedule? ^(Y/N^)
		set /P d_input=Type input:
		If /I "%d_input%"=="y" goto defrag_Setup
		If /I "%d_input%"=="n" goto defrag_NoSetup
		echo Incorrect input & goto Defrag
		
		:Defrag_Setup
			Schtasks /create /SC daily /TN defrag /TR c:\windows\system32\defrag.exe /ST 00:00:00
			echo Set defraggler to run every day at midnight & goto WMIAccess
		
		:Defrag_NoSetup
			echo Keeping current defrag plan

:WMIAccess
	echo.
	echo Set up WMI permissions? ^(Y/N^)
	set /P w_input=Type input:
	If /I "%w_input%"=="y" goto WMI_Setup
	If /I "%w_input%"=="n" goto WMI_NoSetup
	echo Incorrect input & goto WMIAccess
	
	:WMI_Setup
		rem Give WMI Controls
		echo.
		echo Give users WMI access ^(Must be done manually^):
		echo Right click WMI Control ^(Local^) ^> Properties ^> Security ^> Security ^> Add
		echo Add n7wol and grp.fm.admin.wrk and allow all permissions
		start "" /w /b "wmimgmt.msc"
		echo Press any key to continue after setting up WMI permissions...
		pause >nul
		echo.
		goto NET_reinstall
	
	:WMI_NoSetup
		echo Skipping WMI setup
	
:NET_reinstall
	rem Reinstall .NET for certain programs
	echo.
	echo Reinstall .NET? ^(Y/N^)
	set /P n_input=Type input:
	If /I "%n_input%"=="y" goto NET_Setup
	If /I "%n_input%"=="n" goto NET_NoSetup
	echo Incorrect input & goto NET_reinstall

	:NET_Setup
		DISM /Online /Enable-Feature /FeatureName:NetFx3 /Source:\\fm-mdtsrv\Software\Microsoft\Windows_10_Ent_x64\SW_DVD5_WIN_ENT_10_1511.1_64BIT_English_MLF_X20-93758\sources\sxs /All /LimitAccess
		goto Sleep
	
	:NET_NoSetup
		echo Skipping .NET reinstall

rem Change sleep settings
:Sleep
	rem Set screen to turn off after 30 minutes (Not running on battery)
	powercfg -change -monitor-timeout-ac 30
	echo off
	echo Set screen to turn off after 30 minutes

	rem Set computer to never sleep (Not running on battery)
	powercfg -change -standby-timeout-ac 0
	echo Set computer to never sleep

	rem Set computer to require no password on wakeup (Assuming computer is running "Balanced" power mode)
	powercfg -SETACVALUEINDEX SCHEME_BALANCED SUB_NONE CONSOLELOCK 0
	echo Set computer to not require a password on wakeup
	
rem Set default browswer to Internet Explorer
:IEDefault
	echo.
	echo Set IE as default browser? ^(Y/N^)
	set /P i_input=Type input:
	If /I "%i_input%"=="y" goto IE_Setup
	If /I "%i_input%"=="n" goto IE_NoSetup
	echo Incorrect input & goto IEDefault
	
	:IE_Setup
		Cscript "\\fm-mdtsrv\Software\AutoCompSetup\IEdefault.vbs" >nul
		echo Set default browswer as Internet Explorer
		goto CheckModel

	:IE_NoSetup
		echo Keeping current browser as default
		
:CheckModel
	rem If "Surface" is included in the model name
	if not x%BIOSmodel:Surface=%==x%BIOSmodel% (
		echo Surface detected: Skipping bios checks and ethernet changes...
		goto InstallPrograms 
	)
	rem If "Latitude" is included in the model name
	if not x%BIOSmodel:Latitude=%==x%BIOSmodel% (
		echo Laptop detected: Skipping bios checks...
		goto Ethernet
	)
	
rem Update bios if necessary
:CheckBios
	echo Checking bios version...
	if "%BIOSmodel%"=="OptiPlex960" goto 960
	if "%BIOSmodel%"=="OptiPlex9020" goto 9020
	if "%BIOSmodel%"=="PrecisionWorkStationT3500" goto T3500	
	if "%BIOSmodel%"=="OptiPlex760" goto 760
	echo ///Undocumented workstation!/// & goto InstallPrograms

	:760
	if "%BIOSversion%"=="A16" (
		echo ^(Current bios already installed^)
		goto InstallPrograms
	) else start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\760 downloads\O760-A16.exe"
	echo Incorrect version of  bios found. Running installer...
	echo Press any key to continue after updating bios...
	pause >nul
	goto InstallPrograms
		
	:960
		if "%BIOSversion%"=="A18" (
			echo ^(Current bios already installed^)
			goto InstallPrograms
		) else start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\960 Dell Software\O960-A18.exe"
		echo Incorrect version of  bios found. Running installer...
		echo Press any key to continue after updating bios...
		pause >nul
		goto InstallPrograms
		
	:9020
		if "%BIOSversion%"=="A17" (
			echo ^(Current bios already installed^)
			goto InstallPrograms
		) else start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\9020\O9020A17.exe"
		echo Incorrect version of  bios found. Running installer...
		echo Press any key to continue after updating bios...
		pause >nul
		goto InstallPrograms

	:T3500
		if "%BIOSversion%"=="A17" (
			echo ^(Current bios already installed^)
			goto InstallPrograms
		) else start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\T3500\T3500A17.exe"
		echo Incorrect version of  bios found. Running installer...
		echo Press any key to continue after updating bios...
		pause >nul
		goto InstallPrograms
	
:Ethernet
	rem Disable ethernet from being automatically turned off
	call "\\fm-mdtsrv\Software\AutoCompSetup\ethernet.bat"
	
:InstallPrograms
	echo Press any key to continue when ready to install programs...
	pause >nul
	echo.
	call "\\fm-mdtsrv\Software\AutoCompSetup\programs.bat"

:Printers
	echo.
	echo Set up printers? ^(Y/N^)
	set /P r_input=Type input:
	If /I "%r_input%"=="y" goto Printer_Setup
	If /I "%r_input%"=="n" goto Printer_NoSetup
	echo Incorrect input & goto Printers
	
	:Printer_Setup
		call "\\fm-mdtsrv\Software\AutoCompSetup\printers.bat"
		goto Finish
		
	:Printer_NoSetup

:Finish
	echo.
	echo End of setup: 1=Restart, 2=Shut down, 3=Exit
	set /P e_input=Type input:
	If "%e_input%"=="1" shutdown.exe /r /t 00 & goto eof
	If "%e_input%"=="2" shutdown.exe /s /t 00 & goto eof
	If "%e_input%"=="3" exit /B & goto eof
	echo Incorrect input & goto Finish
	
:eof
	echo Thank you for choosing Willis Solutions Inc.












