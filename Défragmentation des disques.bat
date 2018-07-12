@echo off

echo """"""""""""""""""""""""""""""
echo " Defragmentation des disque "
echo "                            "
echo """"""""""""""""""""""""""""""

set /p disque"=" Lettre du disque : "
%windir%\system32\defrag.exe %disque%:

pause