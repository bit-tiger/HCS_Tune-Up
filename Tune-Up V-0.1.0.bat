@echo off
color 0a
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
