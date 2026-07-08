::This English Edition with SOS
::winre.wim is Chinese Edition
::To get Chinese Full Edition, please look Releases

@echo off
cls
title DreasPE for Windows RE
dism >nul
if errorlevel 740 (
    echo Please run as Administrator
    echo Press any key to exit
    pause >nul
    exit
)
echo %~dp0 | find "SOS" && set sos=1
cls
echo DreasRE Setup
echo.
set installver=DreasPE 1.0.3.41.5
if "%sos%"=="1" set installver=DreasPE 1.0.3.41.5 SOS
echo About to install %installver% to your Windows RE
echo Press any key when ready
pause >nul
cls
reagentc /disable /logpath "%temp%\dreasre_install.log"
reagentc /setreimage /path "%~dp0winre.wim" /logpath "%temp%\dreasre_install.log"
reagentc /enable /logpath "%temp%\dreasre_install.log"
if errorlevel 0 (
    echo Install successfully!
) else (
    echo Install failure
    echo Please check the logs to troubleshoot the error
    notepad "%temp%\dreasre_install.log"
)
echo Press any key to exit
pause >nul
exit
