@ECHO OFF

setlocal

:GET_VS_VER
echo Versions of Visual Studio available: 10, 15, 19, 22
set /p vs=Enter Visual Studio Version: 
REM echo %vs%
if defined vs (
  if "%vs%" == "10" set verIsValid=1
  if "%vs%" == "15" set verIsValid=1
  if "%vs%" == "19" set verIsValid=1
  if "%vs%" == "22" set verIsValid=1
) else (
  echo   Using default: Visual Studio 10
  set vs=22
  goto GET_ARCH
)

if defined verIsValid (
  echo    You chose %vs%
) else (
  echo    Invalid version!
  goto GET_VS_VER
)

:GET_ARCH
echo Valid EPICS_HOST_ARCH suffixes:
echo 32             64
echo 32-debug       64-debug
echo 32-static      64-static
set /p eha=Enter suffix: 
REM eha gets set to the first compared item, if it is blank
if "%eha%" == "32" (
  set archIsValid=1
  set archIs64bit=0
) else if "%eha%" == "32-debug" (
  set archIsValid=1
  set archIs64bit=0
) else if "%eha%" == "32-static" (
  set archIsValid=1
  set archIs64bit=0
) else if "%eha%" == "64" (
  set archIsValid=1
  set archIs64bit=1
) else if "%eha%" == "64-debug" (
  set archIsValid=1
  set archIs64bit=1
) else if "%eha%" == "64-static" (
  set archIsValid=1
  set archIs64bit=1
) else if not defined eha (
  echo   Using default: 64-static
  set eha=64-static
  set archIs64bit=1
  goto SET_ENV
)

if defined archIsValid (
  echo    You chose %eha%
) else (
  echo    Invalid arch!
  goto GET_ARCH
)

:SET_ENV

if %archIs64bit% EQU 1 (
  set filename=%~dp0VS%vs%\windows-x%eha%.bat
) else (
  set filename=%~dp0VS%vs%\win32-x%eha:32=86%.bat
)

echo Sourcing %filename%
echo launch dir: "%~dp0"
echo current dir: "%CD%"

cmd.exe /K %filename%

echo pause
pause

endlocal 

rem cmd.exe /K D:\epics\base-3.14.12.5\startup\windows-x64.bat