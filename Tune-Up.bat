@echo off
color 17
title HCS Tune-Up Script V0.3.0
goto :menu


:: **************************************
:: the menu interface 
: menu
cls
	
	echo.         HCS Tune-Up Script V-0.3.0
	echo.           (Script by bit-tiger)   
	echo.                                   
	echo. h - help         x - exit         i - info
	echo. ******************************************
	echo. 1. Install tools and make HCS-Tools Folder
	echo. 2. Update tools  
	
	:: **************************************
	:: menu logic
	
	choice /c hi12x /n
	cls
	IF %errorlevel%==1 (
		goto :help
	) ELSE IF %errorlevel%==2 (
		goto :info
	) ELSE IF %errorlevel%==3 (
		goto :install
	) ELSE IF %errorlevel%==4 (
		goto :update
	) ELSE IF %errorlevel%==5 (
		goto eof
	) ELSE echo. please pick an option
	pause
	goto :menu
	
:: **************************************
: install
cls
	
	:: MalwareBytes
	winget install "Malwarebytes" -s winget
	
	:: CCleaner
	winget install "CCleaner" -s winget
	
	:: VLC
	winget install "VLC media player" -s winget
	
	:: Firefox
	winget install "Mozilla Firefox" -s winget
	
	cls
	echo. Tools Installed
	pause
	:: **************************************
	cls
	
	mkdir %userprofile%\Desktop\HCS_Tools
	set HCS=%userprofile%\Desktop\HCS_Tools
	
	powershell -command "wget https://ulm.aeroadmin.com/AeroAdmin.exe -O 'Call_HCS_4_Help_(360)-379-4865.exe'"
	
	move "C:\Users\Public\Desktop\CCleaner.lnk" %HCS%
	del "C:\Users\Public\Desktop\VLC media player.lnk"
	move "C:\Users\Public\Desktop\Firefox.lnk" "%userprofile%/desktop"
	move "C:\Users\Public\Desktop\Malwarebytes.lnk" %HCS%
	move "Call_HCS_4_Help_(360)-379-4865.exe" %HCS%
	
	goto :menu
:: **************************************
:update
cls
	
	:: MalwareBytes
	winget upgrade "Malwarebytes" -s winget
	
	:: CCleaner
	winget upgrade "CCleaner" -s winget
	
	:: VLC
	winget upgrade "VLC media player" -s winget
	
	:: Firefox
	winget upgrade "Mozilla Firefox" -s winget
	
	:: AeroAdmin
	powershell -command "wget https://ulm.aeroadmin.com/AeroAdmin.exe -O 'Call_HCS_4_Help_(360)-379-4865.exe'"
	move "Call_HCS_4_Help_(360)-379-4865.exe" %HCS%
	
	goto :menu
:: **************************************
:info
cls
	echo. HCS Tune-Up Script V-0.3.0
	echo. Made by bit-tiger for HADLOCK COMPUTER SERVICES
	
:: **************************************
:help
cls
	echo. Option 1 will install; Malwarebytes, CCleaner, VLC, Firefox, and aero admin.
	echo. It wll then create the HCS_Tools folder, and place links to the apps in said folder.
	echo.
	echo. Option 2 will update all of those same apps.