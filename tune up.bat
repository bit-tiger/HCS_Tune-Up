echo off
cd %userprofile%/desktop
cls

:start
  cls
  echo HCS Tune-Up Script V 0.0.1
  echo (Script by Bit_Tiger)
  echo.
  echo 1. install all tools and make "HCS Tools" folder on desktop
  echo 2. update all tools
  SET /p input_opt= input option:
  IF "%input_opt%"=="1" (goto :install) ELSE (IF "%input_opt%"=="2" (goto :update) ELSE (goto :ukin))
  
  goto :start

:ukin
  cls
  echo unknown input
  pause
goto :start

:install
  winget install "Malwarebytes" -s winget
  winget install "CCleaner" -s winget
  winget install "VLC media player" -s winget
  winget install "Mozilla Firefox" -s winget
  pause
  cls
  mkdir "HCS Tools"
  move "C:\Users\Public\Desktop\CCleaner.lnk" "HCS Tools"
  del "C:\Users\Public\Desktop\VLC media player.lnk"
  move "C:\Users\Public\Desktop\Firefox.lnk" "%userprofile%/desktop"
  move "C:\Users\Public\Desktop\Malwarebytes.lnk" "HCS Tools"
  pause

goto :start

:update
  winget upgrade "Malwarebytes" -s winget
  winget upgrade "CCleaner" -s winget
  winget upgrade "VLC media player" -s winget
  winget upgrade "Mozilla Firefox" -s winget
  pause

goto :start
