rem This details altering permissions, ownerships, and sharing options.
rem I'm keeping it here becuase this took forever to figure out and I ended up not needing it. (╯°ヮ°）╯︵ ┻━┻
takeown /f "C:\Windows\System32\DriverStore\FileRepository" /r >nul
icacls "C:\Windows\System32\DriverStore\FileRepository" /grant n7wol@wwu.edu:F /t >nul
if not exist "C:\Windows\System32\DriverStore\FileRepository\hpcu190u.inf_amd64_016ba0cfcf104d26" mkdir "C:\Windows\System32\DriverStore\FileRepository\hpcu190u.inf_amd64_016ba0cfcf104d26"
takeown /f "C:\Windows\System32\DriverStore\FileRepository\hpcu190u.inf_amd64_016ba0cfcf104d26" /r >nul
icacls "C:\Windows\System32\DriverStore\FileRepository\hpcu190u.inf_amd64_016ba0cfcf104d26" /grant n7wol@wwu.edu:F  /t >nul
net share sharename="C:\Windows\System32\DriverStore\FileRepository" /unlimited >nul
