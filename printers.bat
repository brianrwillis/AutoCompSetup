@echo off
echo Installing printers...
rem PP227 Ricoh-WCC
rem Creating this temporary folder just makes the code simpler
md C:\DRIVERS

rem Change to location of folder holding driver for printer
xcopy "\\fm-mdtsrv\Software\Printers\Ricoh C2003\PLC6 W10 64b\64bit" C:\DRIVERS /I /y /D /q >nul

rem Adds a printer port with name and IP Address
rem Change 2nd and 3rd arguments to IP Address of printer
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.182" -h "140.160.20.182" -o raw -n 9100 >nul

rem Installs the printer driver, first getting the printer model (name of driver) and .inf file, then -h for the path to the .dll
rem Change 2nd argument to the name of the driver, 3rd argument to driver located on server, 4th argument to folder holding the .dll
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "PCL6 Driver for Universal Print" -i "C:\DRIVERS\oemsetup.inf" -h "C:\DRIVERS" >nul

rem Gives the printer a name, linking the model (name of driver) and printer port (IP Address)
rem Change 2nd argument to name of printer, 3rd argument to name of the driver, 4th argument to IP Address of printer
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP227 Ricoh-WCC" -m "PCL6 Driver for Universal Print" -r "140.160.20.182" >nul
echo Installed PP227 Ricoh-WCC 

rem PP116 Ricoh Workroom
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.166" -h "140.160.20.166" -o raw -n 9100 >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "PCL6 Driver for Universal Print" -i "C:\DRIVERS\oemsetup.inf" -h "C:\DRIVERS" >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP116 Ricoh Workroom" -m "PCL6 Driver for Universal Print" -r "140.160.20.166" >nul
echo Installed PP116 Ricoh Workroom

rem Delete our temporary folder
rd C:\DRIVERS /s /q

rem Recreate our temporary folder for different drivers
md C:\DRIVERS

rem The drivers we need are already in System32, we just need to locate them. 
rem Can be named differently machine to machine, but they all begin with "prnhpcl3.inf_"
cd "C:\Windows\System32\DriverStore\FileRepository\"
for /f "eol=: delims=" %%F in ('dir /b^|find "prnhpcl3.inf_"') do xcopy "%%F" C:\DRIVERS /I /y /D /q >nul

rem PP227 HP 4345mfp
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.67" -h "140.160.20.67" -o raw -n 9100 >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "HP LaserJet M4345 MFP PCL6 Class Driver" -i "C:\DRIVERS\prnhpcl3.inf" -h "C:\DRIVERS" >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP227 HP 4345mfp" -m "HP LaserJet M4345 MFP PCL6 Class Driver" -r "140.160.20.67" >nul
echo Installed PP227 HP 4345mfp

rem PP305 LaserJet P3005 (Only install in trailer computers)
:PP305_LaserJet_P3005
	echo.
	echo Set up the PP305 LaserJet P3005 ^(For trailer computers only^)? ^(Y/N^)
	set /P p_input=Type input:
	If /I "%p_input%"=="y" goto PP305_LaserJet_P3005_Setup
	If /I "%p_input%"=="n" goto PP305_LaserJet_P3005_NoSetup
	echo Incorrect input & goto PP305_LaserJet_P3005

	:PP305_LaserJet_P3005_Setup
		Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.167" -h "140.160.20.167" -o raw -n 9100 >nul
		Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "HP LaserJet P3004/P3005 PCL6 Class Driver" -i "C:\DRIVERS\prnhpcl3.inf" -h "C:\DRIVERS" >nul
		Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP305 HP LaserJet P3005" -m "HP LaserJet P3004/P3005 PCL6 Class Driver" -r "140.160.20.167" >nul
		echo Installed PP305 HP LaserJet P3005
		
	:PP305_LaserJet_P3005_NoSetup

rem PP232 HP ColorJet CP4020
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.179" -h "140.160.20.179" -o raw -n 9100 >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "HP Color LaserJet CP4025/4525 PCL6 Class Driver" -i "C:\DRIVERS\prnhpcl3.inf" -h "C:\DRIVERS" >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP232 HP ColorJet CP4020" -m "HP Color LaserJet CP4025/4525 PCL6 Class Driver" -r "140.160.20.179" >nul
echo Installed PP232 HP ColorJet CP4020

rem PP106 HP LaserJet P3005
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.165" -h "140.160.20.165" -o raw -n 9100 >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "HP LaserJet P3004/P3005 PCL6 Class Driver" -i "C:\DRIVERS\prnhpcl3.inf" -h "C:\DRIVERS" >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP106 HP LaserJet P3005" -m "HP LaserJet P3004/P3005 PCL6 Class Driver" -r "140.160.20.165" >nul
echo Installed PP106 HP LaserJet P3005

rd C:\DRIVERS /s /q

md C:\DRIVERS
xcopy "\\fm-mdtsrv\Software\Printers\hp4500ps3 64b" C:\DRIVERS /I /y /D /q >nul

rem PP106 HP DesignJet 4500ps Plotter
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnport.vbs" -a -r "140.160.20.64" -h "140.160.20.64" -o raw -n 9100 >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "HP Designjet 4500mfp PS3" -i "C:\DRIVERS\hpi4500v.inf" -h "C:\DRIVERS" >nul
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p "PP106 HP DesignJet 4500ps Plotter" -m "HP Designjet 4500mfp PS3" -r "140.160.20.64" >nul
echo Installed PP106 HP DesignJet 4500ps Plotter

rd C:\DRIVERS /s /q		

:HP_MFP_127fw
	echo.
	echo Set up the HP MFP 127fw? ^(Y/N^)
	set /P p_input=Type input:
	If /I "%p_input%"=="y" goto HP_MFP_127fw_Setup
	If /I "%p_input%"=="n" goto HP_MFP_127fw_NoSetup
	echo Incorrect input & goto HP_MFP_127fw

	:HP_MFP_127fw_Setup
		start "" /w /b "\\fm-mdtsrv\Software\Printers\HPMFP_127fw\W8.1_64\Setup.exe"
		echo.
		echo Software Install ^> Next 
		echo Uncheck Installation Report
		echo Connect thorugh a network ^> Search by IP
		echo Set as default, do not print test page
		echo.
		echo Different offices will have different printers and IP Addresses:
		echo Steam Plant ^(SP220^): 140.160.5.100
		echo Physical Plant ^(Don's Office^): 140.160.20.136
		echo Physical Plant ^(Trailer^): 140.160.20.43
		echo Next ^> Finish
		echo Press any key to continue after finishing install and setup...
		pause >nul
		
	:HP_MFP_127fw_NoSetup
		
		

	
	
echo.
echo Printers installed. Additional Step (User must be logged in): 
echo Control panel ^> Devices and Printers ^> right click on PP227 Ricoh-WCC ^> 
echo Printer Preferences ^> Detailed Settings ^> Job Setup ^> User Code: 34463
echo Repeat for PP116 Ricoh Workroom 
echo.