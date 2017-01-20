rem Find windows version of current machine
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%"=="10.0" (
	echo Windows version detected: 10 
) else echo Windows version detected: Something that isn't 10