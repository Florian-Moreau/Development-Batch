@Echo off & Color F8 & Title ---[ TempClear ]---
 
Fltmc >Nul 2>&1 && (
   Echo.
   Echo                   ษอออออออออออออออออออออออออออออออออออออออออป
   Echo                   บ Note : Permission Administrateur : OK ! บ
   Echo                   ศอออออออออออออออออออออออออออออออออออออออออผ
   Echo.
) || (
   Echo.
   Echo           ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   Echo           บ Note : Veuillez executer ce programme en administrateur ! บ
   Echo           ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
   Echo.
   pause > nul
   exit
)
 
:MENU
Cls
Echo.
Echo                           Bienvenue sur TempClear !
Echo          Cet utilitaire permet de supprimer vos fichiers temporaires.
Echo.
Echo.
Echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
Echo.
Echo  [ Menu de Nettoyage ]
Echo      1 - Commencer le nettoyage.
Echo      2 - Quitter.
Echo.
 
Set /P "choix=Veuillez saisir un numero puis taper 'ENTER' : "
IF "%choix%" == "1" (Goto:DETECT) else (IF "%choix%" == "2" (Exit) else (Goto:MENU))
 
:DETECT
:: Detection de L'OS
for /f "tokens=3,4" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" 2^>NUL ^| Find "ProductName" 2^>NUL') do (set "version_windows=%%a %%b")
:: Detection de L'architecture
if %PROCESSOR_ARCHITECTURE% == x86 (set bits=32) else (set bits=64)
 
Cls
Echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo บ                                 Introduction                                 บ
Echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo  Nom du PC : %COMPUTERNAME%
Echo  Systme d'exploitation: %VERSION_WINDOWS% - %BITS%
Echo.
Echo.
Echo Appuyez sur n'importe qu'elle touche pour commencer le nettoyage.
Echo.
Echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
Pause > Nul
 
:: Petite animation sympatique (voir l'tiquette ':EFFECT' situ tout en bas du code)
cls
Echo  Nettoyage des fichiers temporaires de Windows.   & Call:Effect$
Echo  Nettoyage des fichiers temporaires de Windows..  & Call:Effect$
Echo  Nettoyage des fichiers temporaires de Windows... & Call:Effect$
 
:: Dbut du nettoyage
(
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Temporaires                           ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%SystemRoot%\Temp\*-*"
Del /F /S /Q /A "%SystemRoot%\Temp\*.tmp"
Del /F /S /Q /A "%SystemRoot%\Temp\*.log"
RD /F /S /Q /A "%SystemRoot%\Temp\*-*"
Del /F /S /Q /A "%USERPROFILE%\AppData\Local\Temp\*-*"
Del /F /S /Q /A "%SystemRoot%\WINDOWS\Temp\*-*"
RMDIR /S /Q "%SystemRoot%\Temp"
MKDIR "%SystemRoot%\Temp"
:: Preferences
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Prefetch                              ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%SystemRoot%\Prefetch\*-*"
:: Cookies
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Cookies                               ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\Microsoft\Windows\Cookies\*-*"
:: IE
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Internet Explorer                     ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\Microsoft\Windows\Temporary Internet Files\*-*"
:: Firefox
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Mozilla Firefox                       ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\Local\Mozilla\Firefox\Profiles\*-*"
Del /F /S /Q /A "%AppData%\Roaming\Mozilla\Firefox\Crash Reports\*-*"
:: Chrome
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Google Chrome                         ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\AppData\Local\Google\Chrome\User Data\*.tmp"
:: Recent
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Temporaires recent                    ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\Roaming\Microsoft\Windows\Recent Items\*.*"
Del /F /S /Q /A "%AppData%\Roaming\Microsoft\Windows\Recent\*.lnk"
::Java
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Java                                  ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\LocalLow\Sun\Java\Deployment\cache\*-*"
:: Corbeille
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Poubelle                              ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%SYSTEMDRIVE%\$Recycle.bin\*-*">> log.txt
:: Rapport d'erreurs
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Rapports d'erreurs                    ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%AppData%\Local\Microsoft\Windows\WER\ReportArchive\*-*"
:: XP?
Echo  ^|==================================================================^|
Echo  ^|                    Fichier I.E 5                                 ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%USERPROFILE%\Local Settings\Temp\*-*"
Del /F /S /Q /A "%USERPROFILE%\Local Settings\Temporary Internet Files\*-*"
Del /F /S /Q /A "%USERPROFILE%\Local Settings\Temporary Internet Files\Content.IE5\*-*"
:: Windows defender
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Windows Defender                      ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%PROGRAMDATA%\Microsoft\Windows Defender\Scans\History\CacheManager\*-*"
Del /F /S /Q /A "%PROGRAMDATA%\Microsoft\Windows Defender\Scans\History\Results\Quick\*.*"
Del /F /S /Q /A "%PROGRAMDATA%\Microsoft\Windows Defender\Scans\History\Results\Resource\*-*"
:: Log system32
Echo  ^|==================================================================^|
Echo  ^|                    Fichier Logs                                  ^|
Echo  ^|==================================================================^|
Del /F /S /Q /A "%SystemRoot%\system32\wbem\Logs\*.*"
) > Log.txt & cls
 
Echo  Effectue !
Echo.
Echo  Appuyez sur n'importe qu'elle touche pour quitter.
Pause > Nul
notepad log.txt
EXIT /B
 
:Effect$
Ping localhost -n 2 >NUL
cls
Goto:EOF