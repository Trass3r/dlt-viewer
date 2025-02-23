echo ************************************
echo ***         Configuration        ***
echo ************************************

echo *** Setting up environment ***

REM Currently supported combinations by Qt installation
REM 5.12.12 msvc2015,msvc2017
REM 5.15.2 msvc2015,msvc2019
REM 6.2.2 msvc2019

if "%QTVER%"=="" (
REM    set QTVER=5.12.12
    set QTVER=5.15.2
REM    set QTVER=6.2.2
)

if "%MSVC_VER%"=="" (
REM    set MSVC_VER=2015
REM    set MSVC_VER=2017
    set MSVC_VER=2022
)

if "%MSVC_VER%"=="2015" (
    if "%MSVC_DIR%"=="" set "MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC"
) else (
    for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
        set "MSVC_DIR=%%i\VC\Auxiliary\Build"
    )
)

echo Set QT directory for %QTVER% and %MSVC_VER%
if "%QTDIR%"=="" (
    set QTDIR=C:\Qt\%QTVER%\msvc2019_64
)

if "%QWT%"=="" (
    set QWT=6.1.4
REM    set QWT=6.1.6
    set QWT=6.2.0
)

set PATH=%QTDIR%\bin;%MSVC_DIR%;%PATH%
