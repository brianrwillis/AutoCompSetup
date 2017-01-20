@echo off
echo Installing software...
set "lic_open="
set lic_open=n
set "jupdater_removed="
set jupdater_removed=n
	
rem Firefox
if not exist "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" (
	echo Firefox not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Firefox\Firefox Setup Stub 49.0.1.exe"
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(Firefox already installed^)
rem Chrome
if not exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
	echo Chrome not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Google Chrome\ChromeSetup.exe"
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(Chrome already installed^)

rem Acrobat XI Pro
if not exist "C:\Program Files (x86)\Adobe\Acrobat 11.0\Acrobat\Acrobat.exe" (
	echo Acrobat not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Adobe Products\AcrobatPro_XI\Win\Setup.exe"
	
	rem Opens up the txt file that has the serial numbers for the licensed software
	if "%lic_open%"=="n" (
		start "" /w /b "\\fm-mdtsrv\Software\Adobe Products\Adobe cs4-6 Lic.txt"
		set lic_open=y
		echo.
		echo Opened up txt file that has the serial numbers for the licensed software.
		echo Keep this handy when installing programs.
		echo.
	)
	echo Press any key to continue after finishing install...
	pause >nul
	start "" /w /b "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Acrobat XI Pro.lnk"
	echo.
	echo Select Accept ^> Skip ^> Help ^> Update to current version
	echo Press any key to continue after finishing setup...
	pause >nul	
) else echo ^(Acrobat already installed^)

rem Snagit
if not exist "C:\Program Files (x86)\TechSmith\Snagit 12\Snagit32.exe" (
	echo Snagit not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Snagit\snagit.exe"
	start "" /w /b "\\fm-mdtsrv\Software\Snagit\Snagit 12 lic.txt"
	echo.
	echo Click on the preferences button on the new popup and uncheck the first option
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(Snagit already installed^)

rem Office 2016 32-bit (Access, Excel, Word, Outlook, Powerpoint)
if exist "C:\Program Files (x86)\Microsoft Office\Office16\MSACCESS.EXE" (
	if exist "C:\Program Files (x86)\Microsoft Office\Office16\EXCEL.EXE" (
		if exist "C:\Program Files (x86)\Microsoft Office\Office16\WINWORD.EXE" (
			if exist "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" (
				if exist "C:\Program Files (x86)\Microsoft Office\Office16\POWERPNT.EXE" (
					echo ^(Necessary Office programs already installed^)		
				)
			)
		)
	)
) else (
	echo Necessary Office programs not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Microsoft\Office_2016_Win\Office_ProPlus_2016_x32\Setup.exe"
	echo Press any key to continue after finishing install...
	pause >nul
)

rem Teamviewer
if not exist "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" (
	echo Teamviewer not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\TeamViewer\TV12\TeamViewer_Setup_en.exe"
	echo.
	echo Select "Installation to access this computer remotely (unattended)"
	echo Select "Company/Commercial use" 
	echo Check "Show advanced settings" 
	echo Check first two options, uncheck 3rd
	echo Password: OutLan
	echo Select "I already have a TeamViewer account"
	echo Username: not putting this on github
	echo Password: not putting this on github
	echo Check "Keep me signed in"
	echo Have Don check his email, then sign in
	echo Select "Add this computer" if not already in list
	echo Extras ^> Options ^> Advanced
	echo Import reg file found under TeamViewer/T11 in the server
	echo Drag Computer in "All Partners" to "My Partners" if not already there
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(Teamviewer already installed^)

rem Spiceworks
if not exist "C:\Program Files (x86)\Spiceworks\Agent\Spiceworks Agent App.exe" (
	echo Spiceworks not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Spiceworks install\Spiceworks Agent.msi"
	echo.
	echo Server Address: 140.160.20.173
	echo Port: 443
	echo Authorization Key: not putting this on github
	echo Next ^> Next ^> Install
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(Spiceworks already installed^)

rem Malwarebytes corporate
if not exist "C:\Program Files (x86)\Malwarebytes' Anti-Malware\mbam.exe" (
	echo Malwarebytes not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\MalwareBytes\Anti-Malwarebytes_for_Business\Standalone\Windows\mbam-setup-1.80.2.1012.exe"
	
	rem Opens up the txt file that has the serial numbers for the licensed software
	if "%lic_open%"=="n" (
		start "" /w /b "\\fm-mdtsrv\Software\Adobe Products\Adobe cs4-6 Lic.txt"
		set lic_open=y
		echo.
		echo Opened up txt file that has the serial numbers for the licensed software.
		echo Keep this handy when installing programs.
		echo.
	)
	
	echo.
	echo Select Activate ^> enter ID and Key
	echo Scheduler ^> Add
	echo Change setting to do a full scan daily starting next day at 1:00AM
	echo Check 1st, 2nd, 3rd, 4th, and 6th boxes ^> Add ^> ^Exit
	echo Press any key to continue after finishing install and setup...
	pause >nul
) else echo ^(Malwarebytes already installed^)

rem VLC
if not exist "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" (
	echo VLC not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\VLC\vlc-2.2.4-win32.exe"
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(VLC already installed^)

rem java build 7 update 71 32-bit -> Old version which is actually a security risk but ¯\_(ツ)_/¯
if not exist "C:\Program Files (x86)\Java\jre7\bin\java.exe" (
	echo Java build 7 update 71 not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Java\jre-7u71-windows-i586.exe"
	echo Press any key to continue after finishing install...
	pause >nul
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jusched.exe" del "C:\Program Files (x86)\Common Files\Java\Java Update\jusched.exe" & set jupdater_removed=y
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jucheck.exe"	del "C:\Program Files (x86)\Common Files\Java\Java Update\jucheck.exe" & set jupdater_removed=y
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jaucheck.exe" del "C:\Program Files (x86)\Common Files\Java\Java Update\jaucheck.exe" & set jupdater_removed=y
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jaureg.exe" del "C:\Program Files (x86)\Common Files\Java\Java Update\jaureg.exe" & set jupdater_removed=y
) else (
	echo ^(Old version of java already installed^)
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jusched.exe" del "C:\Program Files (x86)\Common Files\Java\Java Update\jusched.exe" & set jupdater_removed=y
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jucheck.exe"	del "C:\Program Files (x86)\Common Files\Java\Java Update\jucheck.exe" & set jupdater_removed=y
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jaucheck.exe" del "C:\Program Files (x86)\Common Files\Java\Java Update\jaucheck.exe" & set jupdater_removed=y
	if exist "C:\Program Files (x86)\Common Files\Java\Java Update\jaureg.exe" del "C:\Program Files (x86)\Common Files\Java\Java Update\jaureg.exe" & set jupdater_removed=y
)
if "%jupdater_removed%"=="y" echo Removed java auto updaters

rem SQL Server for ODBC
if not exist "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\SQL\en\DropSqlPersistenceProviderLogic.sql" (
	echo SQL Server not found. Running installer...
	start "" /w /b "\\fm-mdtsrv\Software\Microsoft\SQL Native Drivers\SqlServerODBC13.msi"
	echo Press any key to continue after finishing install...
	pause >nul
) else echo ^(SQL Server already installed^)

:ODBC
	echo.
	echo Set up ODBC? (^User must be logged in^) ^(Y/N^)
	set /P o_input=Type input:
	If /I "%o_input%"=="y" goto ODBC_Setup
	If /I "%o_input%"=="n" goto ODBC_NoSetup
	echo Incorrect input & goto ODBC
	
	:ODBC_Setup
		start "" /w /b "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (32-bit).lnk"
		echo User DSN ^> Add ^> SQL Server ^> Next
		echo Enter: DBCLUSTER, WWU SQL Server, DBCLUSTER
		echo Check "Change the default database to:" and enter in "FM_DATA" ^> Next ^> Finish ^> Test Data Source
		goto eof

	:ODBC_NoSetup
		echo Skipping ODBC setup


:eof
	echo Finished installing programs, press any key to continue...
	pause >nul
	
	
	