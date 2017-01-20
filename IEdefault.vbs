Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "%windir%\system32\control.exe /name Microsoft.DefaultPrograms /page pageDefaultProgram\pageAdvancedSettings?pszAppName=Internet%20Explorer"
' Give Default Programs time to load
WScript.Sleep 1800
' WshShell.AppActivate "Set Program Associations"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys " "
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys " "
Msgbox "Default Browser: Internet Explorer"
WScript.Quit
