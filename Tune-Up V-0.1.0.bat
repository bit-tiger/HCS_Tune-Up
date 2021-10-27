@echo off
color 17
title HCS Tune-Up Script V0.1.0
goto :menu


:: **************************************
:: the menu interface 
: menu
cls
	
	echo.         HCS Tune-Up Script V0.1.0
	echo.           (Script by bit-tiger)
	echo. 
	echo. h - help                          i - info
	echo. ******************************************
	echo. 1. Run CCleaner
	echo. 2. Run MalwareBytes
	echo. 3. Install tools and make HCS-Tools Folder
	echo. 4. Update tools  
	
	:: **************************************
	:: menu logic
	
	choice /c hi1234 /n
	cls
	IF %errorlevel%==1 (
		goto :help
	) ELSE IF %errorlevel%==2 (
		goto :info
	) ELSE IF %errorlevel%==3 (
		goto :ccleaner
	) ELSE IF %errorlevel%==4 (
		goto :malwarebytes
	) ELSE IF %errorlevel%==5 (
		goto :install
	) ELSE IF %errorlevel%==6 (
		goto :update
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
	cls
	
	:: making HCS_Tools folder
	mkdir %userprofile%\Desktop\HCS_Tools
	set HCS=%userprofile%\Desktop\HCS_Tools
	
	:: downloading AeroAdmin
	powershell -command "wget https://ulm.aeroadmin.com/AeroAdmin.exe -O 'Call_HCS_4_Help_(360)-379-4865.exe'"
	
	:: moving files into HCS_Tools folder
	move "C:\Users\Public\Desktop\CCleaner.lnk" %HCS%
	del "C:\Users\Public\Desktop\VLC media player.lnk"
	move "C:\Users\Public\Desktop\Firefox.lnk" "%userprofile%/desktop"
	move "C:\Users\Public\Desktop\Malwarebytes.lnk" %HCS%
	move "Call_HCS_4_Help_(360)-379-4865.exe" %HCS%
	
	goto :menu
