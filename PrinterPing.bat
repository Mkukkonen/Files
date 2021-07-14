@echo off
Color 0a

:Start
cls
echo                               PRINTER PING UTILITY
echo                         TRADEMARK ROBCO SYSTEMS 2060-2075 
echo.
echo.
echo.
Set /p Printer=Printername: P
Ping hostprefix-P%Printer% -n 1
echo.
goto :Choice

:Choice
Set /P Again=Do you want to ping a different printer or Web interface{Ping/Web/Exit}? 
echo.


If /I "%Again%" EQU "Ping" goto :Start
If /I "%Again%" EQU "Exit" goto :End
If /I "%Again%" EQU "Web" goto :Web
If /I "%Again%" EQU "P" goto :Start
If /I "%Again%" EQU "E" goto :End
If /I "%Again%" EQU "W" goto :Web
Goto :Choice

:Web

start iexplore.exe hostprefix-P%Printer%.domain.com
echo.

Goto :Choice

:End

exit


::Made by L2-MattK


