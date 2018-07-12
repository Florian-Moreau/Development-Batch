if exist r:\ net use r: /d
net use r: \\172.16.50.10\classes /user:stssio\moreaufl

rem Pour mettre un mdp : net use r: \\172.16.50.10\classes MOTDEPASSE /user:stssio\moreaufl

if exist x:\ net use x: /d
net use x: \\172.16.50.10\outils_etudiants_sio /user:stssio\moreaufl

pause