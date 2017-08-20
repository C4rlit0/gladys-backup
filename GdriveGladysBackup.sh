#!/bin/bash
echo '// SAUVEGARDE //'
echo 'Création de la sauvegarde de la base de données'
var_DAY_MAX="30" #durée max d’ancienneté des fichiers
var_DATE_OLD=$(date -d "$var_DAY_MAX day ago" +%Y-%m-%dT%H:%M:%S)
var_BKP_FILE_NAME=gladys-$(date +%Y-%m-%d-%H-%M).sql
mysqldump -uroot -proot gladys > /home/pi/gladys-backup/"$var_BKP_FILE_NAME"
echo 'Sauvegarde créée'
echo 'Upload vers Google Drive'
cd /home/pi/gladys-backup
var_GLDS_BKP_FLD_ID=$(cat GLDS_BKP_FLD_ID.txt)
./gdrive upload --parent "$var_GLDS_BKP_FLD_ID" "$var_BKP_FILE_NAME" --delete
echo 'Sauvegarde terminée !'
echo '// NETTOYAGE //'
echo 'Création de la liste des anciens fichiers'
./gdrive list --no-header -q "'$var_GLDS_BKP_FLD_ID' in parents and modifiedTime < '$var_DATE_OLD'" | cut -d' ' -f1 > GLDS_OLD_FILE.txt
echo 'Suppression des anciens fichiers'
for i in $(cat GLDS_OLD_FILE.txt)
do
./gdrive delete "$i"
done
echo 'Suppression de la liste'
rm GLDS_OLD_FILE.txt
echo 'Nettoyage terminé !' 
