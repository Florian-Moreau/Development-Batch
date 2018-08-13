@echo off
title= ---- Bloqueur - Débloqueur ----
%homedrive%
cd\
cd \windows\system32
:début
color e
cls
echo ****************************************************************************
echo **************************** Faites votre choix ****************************
echo ****************************************************************************
echo ****************************************************************************
echo ****************************************************************************
echo * 1 : Bloquer l'acces a l'invite de commande.                              *
echo * 2 : Bloquer l'acces au panneau de configuration.                         *
echo * 3 : Appliquer l'ecran d'accueil classique.                               *
echo * 4 : Appliquer l'ecran d'accueil moderne. Par defaut.                     *
echo * 5 : Bloquer l'acces a l'element : Ajout suppression des programmes.      *
echo * 6 : Bloquer l'element : Options des dossiers.                            *
echo * 7 : Desactiver le menu contextuel de la barre des taches.                *
echo * 8 : Desactiver le menu contextuel du bureau.                             *
echo * 9 : Desactiver la restauration systeme.                                  *
echo * 10 : Desactiver le gestionnaire des taches.                              *
echo * 11 : Desactiver l'installation de programme pour tous les utilisateurs.  *
echo * 12 : Desactiver les outils de modifications du Registre.                 *
echo * 13 : Desactiver l'ajout d'icone sur le bureau.                           *
echo * 14 : Interdire le changement de papier paint (fond d'ecran).             *
echo * 15 : Interdire la modification de la barre d'outils.                     *
echo * 16 : Empecher la supression d'icone.                                     *
echo * 17 : Desactiver la commande executer.                                    *
echo * 18 : Desactiver la modification des proprietes de la barre des taches.   *
echo * 19 : Desactiver l'acces au panneau d'affichage.                          *
echo ****************************************************************************
echo * 20 : Avoir acces a l'invite de commande.                                 *
echo * 21 : Avoir l'acces au panneau de configuration.                          *
echo * 22 : Activer l'acces a l'element : Ajout suppression de programmes.      *
echo * 23 : Activer l'element : Options des dossiers.                           *
echo * 24 : Activer le menu contextuel de la barre des taches.                  *
echo * 25 : Activer le menu contextuel du bureau.                               *
echo * 26 : Reactiver la restoration systeme.                                   *
echo * 27 : Reactiver le gestionnaire des taches.                               *
echo * 28 : Autoriser les instalation poour tout les utilisateurs.              *
echo * 29 : Reactiver le Registre.                                              *
echo * 30 : Reactiver l'ajout d'icone sur le bureau.                            *
echo * 31 : Reactiver le chamgement de papier paint.                            *
echo * 32 : Reactiver la modification de la barre d'outils.                     *
echo * 33 : Reactiver la supression d'icones.                                   *
echo * 34 : Reactiver la commande executer.                                     *
echo * 35 : Reactiver la modification des proprietes de la barre des taches.    *
echo * 36 : Reactiver le panneau d'affichage.                                   *
echo * 37 : Fermer l'application.                                               *
echo ****************************************************************************
set /p choix=Quel action voulez-vous faire ? : 
(
if not %choix%=='' set choix=%choix:~0,1%
if %choix%==1 goto B_cmd
if %choix%==2 goto B_cp
if %choix%==3 goto B_logon1
if %choix%==4 goto B_logon2
if %choix%==5 goto B_noaddre
if %choix%==6 goto B_nfo
if %choix%==7 goto B_menubdt
if %choix%==8 goto B_menub
if %choix%==9 goto B_RS
if %choix%==10 goto B_TaskMgr
if %choix%==11 goto B_USI
if %choix%==12 goto B_drt
if %choix%==13 goto B_NIOD
if %choix%==14 goto B_NCWP
if %choix%==15 goto B_NMTB
if %choix%==16 goto B_NDI
if %choix%==17 goto B_DR
if %choix%==18 goto B_NPTB
if %choix%==19 goto B_NDCPL

if %choix%==20 goto D_cmd
if %choix%==21 goto D_cp
if %choix%==22 goto D_noaddre
if %choix%==23 goto D_nfo
if %choix%==24 goto D_menubdt
if %choix%==25 goto D_menub
if %choix%==26 goto D_RS
if %choix%==27 goto D_TaskMgr
if %choix%==28 goto D_USI
if %choix%==29 goto D_grt
if %choix%==30 goto D_GIOD
if %choix%==31 goto D_GCWP
if %choix%==32 goto D_GDB
if %choix%==33 goto D_GDI
if %choix%==34 goto D_GR
if %choix%==35 goto D_GPTB
if %choix%==36 goto D_GDCPL

if %choix%==37 goto end
)
cls
echo %choix% n'est pas bon !
goto début
:B_cmd
cls
color a
echo Vous avez choisi de bloquer l'acces a l'invite de commande
reg add HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /t REG_DWORD /d 2 /f
pause
goto début
:B_cp
cls
color a
echo Vous avez choisi de bloquer l'acces aux Panneau de configuration.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 1 /f
pause
goto début
:B_logon1
cls
color a
echo Vous avez choisi l'ecran d'accueil classique.
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /v LogonType /t REG_DWORD /d 0 /f
pause
goto début
:B_logon2
cls
color a
echo Vous avez choisi l'ecran d'accueil moderne.
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /v LogonType /f
pause
goto début
:B_noaddre
cls
color a
echo Vous avez choisi de bloquez l'element : Ajout suppression de programmes.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall /v NoAddRemovePrograms /t REG_DWORD /d 1 /f
pause
goto début
:B_nfo
cls
color a
echo Vous avez choisi de bloquez l'acces a l'element : Options des dossier.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f
pause
goto début
:B_menubdt
cls
color a
echo Vous avez choisi de desactiver le menu contextuel de la barre des taches.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /t REG_DWORD /d 1 /f
pause
goto début
:B_menub
cls
color a
echo Vous avez choisi de desactiver le menu contextuel du Bureau.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 1 /f
pause
goto début
:B_RS
cls
color a
echo Vous avez choisi de desactive la restoration systeme.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /t REG_DWORD /d 1 /f
pause
goto début
:B_TaskMgr
cls
color a
echo Vous avez choisi de desactiver le gestionnaire des taches.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
pause
goto début
:B_USI
cls
color a
echo Vous avez choisi d'empecher les instalations pour tout les utilisateur de l'ordinateur.
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v DisableUserInstalls /t REG_DWORD /d 2 /f
pause
goto début
:B_drt
cls
color a
echo Vous avez choisi d'empecher l'ouverture du Registre et empecher la fusion de fichier .reg.
reg add HKCU\Software\Microsoft\Windows\currentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f
pause
goto début
:B_NIOD
cls
color a
echo Vous avez choisi d'empecher l'ajout d'icones sur le bureau.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoAddingComponents /t REG_DWORD /d 1 /f
pause
goto début
:B_NCWP
cls
color a
echo Vous avez choisi de desactiver le chamgement des wallpapers (papiers paints) du bureau.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoChangingWallPaper /t REG_DWORD /d 1 /f
pause
goto début
:B_NMTB
cls
color a
echo Vous avez choisi d'interdir le changement de la barre d'outil.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoCloseDragDropBands /t REG_DWORD /d 1 /f
pause
goto début
:B_NDI
cls
color a
echo vous avez choisi d'interdir la supression d'icones.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoDeletingComponents /t REG_DWORD /d 1 /f
pause
goto début
:B_DR
cls
color a
echo Vous avez choisi de desactiver la commande executer.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f
pause
goto début
:B_NPTB
cls
color a
echo Vous avez choisi de desactiver la modification des propriétés de la barre des taches.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /t REG_DWORD /d 1 /f
pause
goto début
:B_NDCPL
cls
color a
echo Vous avez choisi de desactiver la panneau d'affichage.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v NoDispCPL /t REG_DWORD /d 1 /f
pause
goto début

:D_cmd
cls
color a
echo Vous avez choisi d'obtenir l'acces a l'invite de commande
reg delete HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /f
pause
goto début
:D_cp
cls
color a
echo Vous avez choisi d'obtenir l'acces aux Panneau de configuration.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /f
pause
goto début
:D_noaddre
cls
color a
echo Vous avez choisi d'obtenir l'acces l'element : Ajout suppression de programmes.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall /v NoAddRemovePrograms /f
pause
goto début
:D_nfo
cls
color a
echo Vous avez choisi d'obtenir l'acces a l'element : Options des dossier.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /f
pause
goto début
:D_menubdt
cls
color a
echo Vous avez choisi d'obtenir l'acces au menu contextuel de la barre des taches.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /f
pause
goto début
:D_menub
cls
color a
echo Vous avez choisi d'obtenir l'acces au le menu contextuel du Bureau.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /f
pause
goto début
:D_RS
cls
color a
echo Vous avez choisi de reactiver la restoration systeme.
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /f
pause
goto début
:D_TaskMgr
cls
color a
echo Vous avec choisi de reactiver le gestionnaire des taches. Attention necessite un reboot.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f
pause
goto début
:D_USI
cls
color a
echo Vous avez choisi d'autoriser les instalations pour tout les utilisateurs de l'ordinateur.
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v DisableUserInstalls /f
pause
goto début
:D_grt
cls
color a
echo Vous avez choisi de réactiver le Registre.
reg delete HKCU\Software\Microsoft\Windows\currentVersion\Policies\System /v DisableRegistryTools /f
pause
goto début
:D_GIOD
cls
color a
echo Vous avez choisi de reactiver l'ajout d'icones sur le bureau.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoAddingComponents /f
pause
goto début
:D_GCWP
cls
color a
echo Vous avez choisi de reactiver le changement de papier paint.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoChangingWallPaper /f
pause
goto début
:D_GDB
cls
color a
echo Vous avez choisi de reactiver la modification de la barre d'outil.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoCloseDragDropBands /f
pause
goto début
:D_GDI
cls
color a
echo Vous avez choisi de reactiver la supression d'icones.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoDeletingComponents /f
pause
goto début
:D_GR
cls
color a
echo Vous avez choisi de reactiver la commande executer.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /f
pause
goto début
:D_GPTB
cls
color a
echo Vous avez choisi de reactiver la modification des proprietes de la barre des taches.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /f
pause
goto début
:D_GDCPL
cls
color a
echo Vous avez choisi de reactiver le panneau d'affichage du panneau de configuration.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v NoDispCPL /f
pause
goto début

:end
cls
color a
echo ***************************************************************
echo *************************** Finish ****************************
echo ***************************************************************
echo *********************** Florian Moreau ************************
echo ***************************************************************
echo Vous avez choisi de quitter l'application.
pause