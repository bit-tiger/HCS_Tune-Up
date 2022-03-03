@echo off
title HCS Tune-Up Script V1.0.0

NET SESSION >nul 2>&1
IF %errorlevel% EQU 0 (
	goto :menu
) ELSE (
	color 4f
	
	echo. ERROR: Run as administrator.
	pause
	goto :eof

:: **************************************
:: the menu interface 
: menu
cls
	
	echo.         HCS Tune-Up Script V-1.0.0
	echo.           (Script by bit-tiger)   
	echo.                                   
	echo. h - help         x - exit         i - info
	echo. ******************************************
	echo. 1. Install tools and make HCS-Tools Folder
	echo. 2. Install Open-Office
	echo. 3. Install Adobe-Acrobat-Reader
	echo. 4. Install Libre-Office
	
	:: **************************************
	:: menu logic
	
	choice /c hix123 /n
	cls
	IF %errorlevel%==1 (
		goto :help
	) ELSE IF %errorlevel%==2 (
		goto :info
	) ELSE IF %errorlevel%==3 (
		goto eof
	) ELSE IF %errorlevel%==4 (
		goto :install
	) ELSE IF %errorlevel%==5 (
		goto :oo
	) ELSE IF %errorlevel%==6 (
		goto :lo
	) ELSE IF %errorlevel%==7 (
		goto :aar
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
	timeout /T 5
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
	
	pause
	goto :menu
:: **************************************
:oo
cls
	
	:: Open Office
	winget install "OpenOffice" -s winget
	
	cls
	echo. Open Office installed
	pause
	
	goto :menu
:: **************************************
:aar
cls

	:: Adobe Acrobat Reader
	winget install "Adobe Acrobat Reader DC" -s winget
	
	cls
	echo. Adobe Acrobat Reader installed
	pause
	
	goto :menu
:: **************************************
:lo
cls

	::Libre Office
	winget install "LibreOffice" -s winget

	cls
	echo. Libre Office installed
	pause

	goto :menu

:: **************************************
:info
cls
	echo. HCS Tune-Up Script V-1.0.0
	echo. Made by bit-tiger for HADLOCK COMPUTER SERVICES
	
	pause
	goto :menu
:: **************************************
:help
cls
	echo. Option 1 will install; Malwarebytes, CCleaner, VLC, Firefox, and aero admin.
	echo. It wll then create the HCS_Tools folder, and place links to the apps in said folder.
	echo.
	echo. Option 2 will install Open Office
	echo. Option 3 will install Adobe Acrobat Reader
	echo. Option 4 will install Libre Office 
	
	pause
	goto :menu
