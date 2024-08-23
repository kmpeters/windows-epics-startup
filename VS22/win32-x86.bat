@echo off

rem Automatically set up the environment when possible ("yes" or "no").
set _auto=no

rem Automatically reset PATH ("yes" or "no").
set _auto_path_reset=%_auto%

rem Automatically append to PATH ("yes" or "no").
set _auto_path_append=%_auto%

rem The new value for PATH.
set _path_new=C:\Windows\System32;C:\Windows;C:\Windows\System32\wbem

rem The location of Strawberry Perl (pathname).
set _strawberry_perl_home=C:\Strawberry

rem The location of Microsoft Visual Studio (pathname).
set _visual_studio_home=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community

rem The EPICS host architecture specification for EPICS_HOST_ARCH
set _epics_host_arch=win32-x86

rem The install location of EPICS Base (pathname).
set _epics_base=

rem ----------------------------------------------------------------------
rem Internal parts (There is typically no need to modify these)
rem ----------------------------------------------------------------------

rem Reset PATH
if "%_auto_path_reset%" == "yes" (
  set "PATH=%_path_new%"
)

rem Add Strawberry Perl to PATH
if "%_strawberry_perl_home%" == "" goto after_add_strawberry_perl
rem Can't do this inside parentheses because PATH would be read only once
set "PATH=%PATH%;%_strawberry_perl_home%\c\bin"
set "PATH=%PATH%;%_strawberry_perl_home%\perl\site\bin"
set "PATH=%PATH%;%_strawberry_perl_home%\perl\bin"
:after_add_strawberry_perl

rem Set the environment for Microsoft Visual Studio
call "%_visual_studio_home%\VC\Auxiliary\Build\vcvarsall.bat" x86

rem Set the EPICS host architecture specification
set "EPICS_HOST_ARCH=%_epics_host_arch%"

rem Add the EPICS Base host architecture bin directory to PATH
if "%_auto_path_append%" == "yes" (
  if not "%_epics_base%" == "" (
    set "PATH=%PATH%;%_epics_base%\bin\%_epics_host_arch%"
  )
)

rem Don't leak variables into the environment
set _auto=
set _auto_path_reset=
set _auto_path_append=
set _path_new=
set _strawberry_perl_home=
set _visual_studio_home=
set _epics_host_arch=
set _epics_base=
