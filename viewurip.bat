@echo off
title view ip
set ip_address_string="IPv4 Address"

for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do set IP=%%f
if exist currentipadress goto itexists
echo Press any key to view IP
pause>nul
echo %IP%
echo %IP% > currentipadress
pause
exit

:itexists
cls
(
set /p savedIP=
) <= currentipadress
if %IP: =% == %savedIP: =% (
echo your ip is the same as the last time you opened this program!
echo press any key to reveal IP address
pause>nul
echo %IP%
pause
exit
)
echo your IP wasn't the same as the last time you opened this program!
echo press any key to reveal the IP adress
pause>nul
echo %IP%
echo previous IP address : %savedIP%
echo %IP% > currentipadress
pause
exit
