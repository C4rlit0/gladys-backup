#!/bin/bash
echo '// INITIALISATION //'
rm GLDS_FLD_ID.txt
rm GLDS_BKP_FLD_ID.txt
./gdrive mkdir Gladys | cut -d' ' -f2 > GLDS_FLD_ID.txt
sleep 2
var_GLDS_FLD_ID=$(cat GLDS_FLD_ID.txt)
./gdrive mkdir -p "$var_GLDS_FLD_ID" GLDS_BDD_BKP | cut -d' ' -f2 > GLDS_BKP_FLD_ID.txt
echo 'Arborescence de sauvegarde créée'
echo 'Lancez votre premiere sauvegarde via ./GdriveGladysbackup.sh'