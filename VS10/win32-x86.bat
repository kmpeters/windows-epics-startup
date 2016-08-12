@ECHO OFF

REM   --- Convenience ---
REM set BASE=base-3.14.12.5

REM   --------------- Windows binaries -------------------
set PATH=C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\SYSTEM32\Wbem

REM   --------------- Strawberry perl -------------------
set PATH=C:\Strawberry\perl\bin;%PATH%

REM   --------------- re2c & gnuwin32 make ----------------------
set PATH=D:\bin;%PATH%

REM    ----- Visual Studio 2010 -----
REM --  win32-x86 ---
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86

REM --------------- EPICS --------------------------------
set EPICS_HOST_ARCH=win32-x86
REM set PATH=%PATH%;D:\epics\%BASE%\bin\%EPICS_HOST_ARCH%
REM set PATH=%PATH%;D:\epics\extensions\bin\%EPICS_HOST_ARCH%

REM ----------------- GNU make flags ---------------------
REM set MAKEFLAGS=-w

REM --------------- Epics Channel Access -----------------
REM set EPICS_CA_ADDR_LIST=n.n.n.n  n.n.n.n
REM set EPICS_CA_AUTO_ADDR_LIST=YES

REM ======================================================
REM --------------- Exceed -------------------------------
REM    Needed for X11 extensions
REM ======================================================
REM set EX_VER=14.00
REM set PATH=%PATH%;C:\Exceed%EX_VER%\XDK\
REM set PATH=%PATH%;C:\Program Files\Hummingbird\Connectivity\%EX_VER%\Exceed\
