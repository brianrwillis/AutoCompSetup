@echo off

net localgroup administrators willisb3@wwu.edu /add >nul 2>&1
if %errorlevel%==0 (
	echo willisb3 was sucessfully added to Administrators
) else echo ^(User is already part of the group^)

net localgroup administrators n7wol@wwu.edu /add >nul 2>&1
if %errorlevel%==0 (
	echo n7wol was sucessfully added to Administrators
) else echo ^(User is already part of the group^)

net localgroup administrators grp.fm.admin.wrk /add >nul 2>&1
if %errorlevel%==0 (
	echo grp.fm.admin.wrk was sucessfully added to Administrators
) else echo ^(User is already part of the group^)

net localgroup administrators grp.its.atusadmins /add >nul 2>&1
if %errorlevel%==0 (
	echo grp.its.atusadmins was sucessfully added to Administrators
) else echo ^(User is already part of the group^)

net localgroup "Power users" grp.fm.wrk /add >nul 2>&1
if %errorlevel%==0 (
	echo grp.fm.wrk was sucessfully added to Power Users
) else echo ^(User is already part of the group^)
