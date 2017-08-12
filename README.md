# Gladys-Backup
Gladys database backup to Google Drive

Installation :
--------------

**Executez la commande**

    git clone https://github.com/C4rlit0/gladys-backup.git

**Puis**

    chmod +x ./GdriveGladysInstall.sh

Enfin **lancez** `./GdriveGladysInstall.sh` et suivez les instructions

Durant l'installation, un lien sera généré pour autoriser gdrive à accéder à votre compte Google Drive, ce lien est à coller dans votre navigateur.
Un code à saisir pendant l'installation sera alors fourni.

Vous pourrez alors soit lancer le script `./GdriveGladysBackup.sh` pour effectuer une sauvegarde ponctuelle, soit utliser le systeme crontab natif pour mettre en place une sauvegarde planifiée.

Par exemple si vous voulez effectuer une sauvegarde tout les jours à minuit, exécutez la commande :

    crontab -l | { cat; echo "0 0 * * * /home/pi/gladys-backup/GdriveGladysBackup.sh"; } | crontab -

Explication du fonctionnement :

    * * * * * "command to be executed"
    
    -  -  -  -  - 
    |  |  |  |  | 
    |  |  |  |  ---- Day of week (0 - 7) (Sunday=0 or 7)
    |  |  |  ------- Month (1 - 12)
    |  |  ---------- Day of month (1 - 31)
    |  ------------- Hour (0 - 23)
    ---------------- Minute (0 - 59)
