# Gladys-Backup
Gladys database backup to Google Drive

Installation :
--------------

**Executez la commande**

    git clone https://github.com/C4rlit0/gladys-backup.git

**Puis**

    cd gladys-backup
    chmod +x ./GdriveGladysInstall.sh

Enfin **lancez** `./GdriveGladysInstall.sh` et suivez les instructions

Durant l'installation, un lien sera généré pour autoriser gdrive à accéder à votre compte Google Drive, ce lien est à coller dans votre navigateur.
Un code à saisir pendant l'installation sera alors fourni.

Utilisation
-----------

Vous pouvez soit lancer le script `./GdriveGladysBackup.sh` pour effectuer une sauvegarde ponctuelle, soit utliser le systeme crontab natif pour mettre en place une sauvegarde planifiée.

Par exemple si vous voulez effectuer une sauvegarde tout les jours à minuit, exécutez la commande :

    crontab -l | { cat; echo "0 0 * * * /home/pi/gladys-backup/GdriveGladysBackup.sh"; } | crontab -

**Explication du fonctionnement :**

    * * * * * "command to be executed"
    
    -  -  -  -  - 
    |  |  |  |  | 
    |  |  |  |  ---- Day of week (0 - 7) (Sunday=0 or 7)
    |  |  |  ------- Month (1 - 12)
    |  |  ---------- Day of month (1 - 31)
    |  ------------- Hour (0 - 23)
    ---------------- Minute (0 - 59)


Notification par Gladys
-----------------------

Si vous souhaitez être notifié par Gladys lorsque la sauvegarde a lieue il vous suffit de créer un réveil basé sur une règle cron :
/!\ **ATTENTION** /!\ Petite différence, Gladys gère les secondes --> vous aurez donc 6 critères et non 5 comme habituellement.

L'équivalent de la commande crontab qui déclenche la sauvegarde tout les jours à minuit (0 0 * * *)

Pour Gladys c'est 0 0 0 * * *

![Reveil](https://i.imgur.com/Cpvgiku.png)

Puis de créer un scénario qui va se déclencher suite à l'alarme :

![scenario](https://i.imgur.com/igAeckh.png)

![choose alarme](https://i.imgur.com/qSVOs3B.png)

![create notifiy](https://i.imgur.com/Na3rfEC.png)
