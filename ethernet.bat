@echo off

rem Find ethernet location in registry and change its settings so it won't ever be shut off

rem Searches the registry for key value involving the word Ethernet" or "Gigabit" by looking at the description "DriverDesc"
rem ♫ Where we find an Ethernet key, that is where the setting will be ♫
rem (Will be anywhere from key 0000 to 0006 where we're searching)
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0004" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0004" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0004" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0004" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0004" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0005" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0005" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0005" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0005" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0005" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0006" /v "DriverDesc" >nul 2>&1
if %errorlevel%==0 (
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0006" /v "DriverDesc" ^|find "Ethernet"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0006" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
	for /f "eol=: delims=" %%F in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0006" /v "DriverDesc" ^|find "Gigabit"') do (
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0006" /v "PnPCapabilities" /t REG_DWORD /d 24 /f >nul
		echo Disabled ethernet from being automatically turned off
		goto eof
	)
)

echo Unable to change ethernet settings automatically. Manually disallow ethernet from being turned off:
echo Network and Sharing Center ^> Ethernet ^> Properties ^> Configure ^> Power Management
echo Uncheck "Allow the computer to turn off this device to save power"
echo Press any key to continue after changing ethernet settings...
pause >nul

:eof
