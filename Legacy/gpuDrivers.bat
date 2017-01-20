rem Update video driver if necessary
rem Windows 10 finds gpu drivers automatically, so I took this out.
rem Plus re-downloading the most current drivers whenever they are updated onto the server is a pain ( ._.)
:CheckVideoDrivers
	echo.
	echo Reinstall video drivers from server? ^(Y/N^)
	set /P v_input=Type input:
	If /I "%v_input%"=="y" goto Driver_Setup
	If /I "%v_input%"=="n" goto Driver_NoSetup
	echo Incorrect input & goto CheckVideoDrivers
	
	:Driver_Setup
		echo.
		echo Checking video drivers...
		rem GeForce GTX 650
		if "%GPU_NAME%"=="NVIDIA GeForce GTX 650 Ti BOOST" (
			if not exist "C:\NVIDIA\DisplayDriver\375.95\Win10_64\International\Display.Driver\DisplayDriver.nvi" (
				echo Running installer for 650 Ti BOOST...
				start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\T3500\375.95-desktop-win10-64bit-international-whql.exe"
				pause
				goto CheckBios
			)
			echo ^(Current video drivers already installed^)
			goto CheckBios
		)
			
		rem Radeon R7 250
		if "%GPU_NAME%"=="AMD Radeon R7 200 Series" (
			if not exist "C:\AMD\Non-WHQL-Win10-64Bit-Radeon-Software-Crimson-16.11.4-Nov15\Setup.exe" (
				echo Running installer for R7 200 Series...
				start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\9020\non-whql-win10-64bit-radeon-software-crimson-16.11.4-nov15.exe"
				pause
				goto CheckBios
			)
			echo ^(Current video drivers already installed^)	
			goto CheckBios
		)
		
		rem ATI Radeon HD 4600 Series
		if "%GPU_NAME%"=="ATI Radeon HD 4600 Series" (
			echo //////////////////////////////////////////
			echo FIX THIS PART WHEN YOU DOWNLOAD THE DRIVER
			echo //////////////////////////////////////////
			if not exist "C:\ATI\Support\10-8_vista64_win7_64_dd_ccc_enu\FIX.FIXTHIS" (
				echo Running installer for HD 4600 Series...
				start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\960 Dell Software\managan video\10-8_vista64_win7_64_dd_ccc_enu.exe"
				pause
				goto CheckBios
			)
			echo ^(Current video drivers already installed^)	
			goto CheckBios
		)
		
		rem NVIDIA GeForce GTX 645
		if "%GPU_NAME%"=="NVIDIA GeForce GTX 645" (
			if not exist "C:\NVIDIA\DisplayDriver\376.19\Win10_64\International\Display.Driver\dbInstaller.exe" (
				echo Running installer for GTX 645...
				start "" /w /b "\\fm-mdtsrv\Software\.PC Drivers\9020\GTX 645\376.19-desktop-win10-64bit-international-whql.exe"
				pause
				goto CheckBios
			)
			echo ^(Current video drivers already installed^)	
			goto CheckBios
		)
		echo Unknown GPU - Update driver manually & goto CheckBios

	:Driver_NoSetup
		echo Keeping current drivers