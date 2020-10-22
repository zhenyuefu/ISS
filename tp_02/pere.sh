#!/bin/bash
# Affiche un message d’erreur puis s’arrête s’il a été lancé sans paramètres
if [ $# != 1 ]
then
    echo "Il manque un paramètre"
    echo "Usage : ./$0 <nb_fils>"
    exit 1
fi
# Affiche son PID
echo $$
# lance n fois de script fils.sh
nb_fils=$1
num=1 
while [ $num -le $nb_fils ]
do
    echo -n "Fils $num : "
    ./fils.sh
    num=$(($num+1))
done