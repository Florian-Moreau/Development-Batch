@echo off


echo [+] 1 - Configuration IP automatique    [+]
echo [+] 2 - Configuration IP manuelle       [+]
echo [+] 3 - Configuration IP LAB salle info [+]
echo [+] 4 - Configuration DNS uniquement    [+]
echo [+] 5 - Configuration DNS 172.16.43.200 [+]

set /p optionMenu=" Choix ? "
if "%optionMenu%"=="1" goto choix1
if "%optionMenu%"=="2" goto choix2
if "%optionMenu%"=="3" goto choix3
if "%optionMenu%"=="4" goto choix4
if "%optionMenu%"=="5" goto choix5
 
:choix1
set /p carte=" Nom de la carte reseau : "
netsh interface ip set address "%carte%" dhcp
netsh interface ip set dns "%carte%" dhcp
pause
goto eof
 
:choix2
set /p carte=" Nom de la carte reseau : "
set /p IP=" IP : "
set /p mask=" Masque : "
set /p gateway=" Passerelle : "
set /p dns=" DNS : "
netsh interface ip set address "%carte%" static %IP% %mask% %gateway% 1
netsh interface ip set dns "%carte%" static %dns%
pause
goto eof
 
:choix3
netsh interface ip set address "Ethernet" static 172.16.43.225 255.255.0.0 172.16.0.1 1
netsh interface ip set dns "Ethernet" static 172.16.50.25
pause
goto eof
 
:choix4
set /p carte=" Nom de la carte reseau : "
set /p dns=" DNS : "
netsh interface ip set dns "%carte%" static %dns%
pause
goto eof

:choix5
netsh interface ip set dns "Connexion au réseau local" static 172.16.43.200
pause
goto eof

:eof