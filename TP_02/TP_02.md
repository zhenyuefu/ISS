# ISS - Initiation aux Systèmes d’exploitation et au Shell 
## TP 02 – Introduction à la notion de processus
### Exercice 1 : Question de nom
- Question 1
```
28620112@ssh:~/LU2IN020/tp_02$ wget http://julien.sopena.fr/LU2IN020-TP_02.tgz
28620112@ssh:~/LU2IN020/tp_02$ tar xzf LU2IN020-TP_02.tgz 
```
- Question 2
```
28620112@ssh:~/LU2IN020/tp_02$ ls
exo1  exo2  exo3  exo4  LU2IN020-TP_02.tgz
28620112@ssh:~/LU2IN020/tp_02$ cd exo1
28620112@ssh:~/LU2IN020/tp_02/exo1$ ls
mon_test.c  README
28620112@ssh:~/LU2IN020/tp_02/exo1$ cat README 
Compilez mon_test.c avec la commande suivante : gcc mon_test.c -o mon_test
```
- Question 3
```
28620112@ssh:~/LU2IN020/tp_02/exo1$ ./mon_test 
Usage : mon_test <un_entier>
28620112@ssh:~/LU2IN020/tp_02/exo1$ ./mon_test 1
Il n'est pas pair
28620112@ssh:~/LU2IN020/tp_02/exo1$ ./mon_test 2
Il est pair
```
- Question 4
```
28620112@ssh:~/LU2IN020/tp_02/exo1$ mv mon_test est_il_pair
28620112@ssh:~/LU2IN020/tp_02/exo1$ ls
est_il_pair  mon_test.c  README
28620112@ssh:~/LU2IN020/tp_02/exo1$ ./est_il_pair 
Usage : mon_test <un_entier>
```
- Question 5   
On modifie la ligne `printf` dans `mon_test.c`
```c
printf("Usage : %s <un_entier>\n", *argv);
```
### Exercice 2 : Et PATH le chemin
- Question 1
```
28620112@ssh:~/LU2IN020/tp_02/exo1$ cp est_il_pair ../exo2/
28620112@ssh:~/LU2IN020/tp_02/exo1$ cd ../exo2
28620112@ssh:~/LU2IN020/tp_02/exo2$ ./est_il_pair 24
Il est pair
```
- Question 2
```
28620112@ssh:~/LU2IN020/tp_02/exo2$ est_il_pair 24
-bash: est_il_pair : commande introuvable
```
- Question 3
```
28620112@ssh:~/LU2IN020/tp_02/exo2$ export PATH_OLD=$PATH
28620112@ssh:~/LU2IN020/tp_02/exo2$ export PATH=~/LU2IN020/tp_02/exo2:$PATH
28620112@ssh:~/LU2IN020/tp_02/exo2$ est_il_pair 24
Il est pair
```
- Question 4-5
```
28620112@ssh:~/LU2IN020/tp_02/exo2$ PATH=.:$PATH_OLD
28620112@ssh:~/LU2IN020/tp_02/exo2$ cd rep1/
28620112@ssh:~/LU2IN020/tp_02/exo2/rep1$ ls
mkdir
28620112@ssh:~/LU2IN020/tp_02/exo2/rep1$ mkdir rep2
Attention à votre PATH, cette commande aurait pu effacer tous vos fichiers ...
```
- Question 6   
Parce que tous les programmes du répertoire courant seront exécutés en premier.
### Exercice 3 : Une histoire de famille
- Question 1
```sh
#!/bin/bash
# Affiche son PID et le PID de son père
echo "Je suis" $$ "et mon père est" $PPID
```
```
28620112@ssh:~/LU2IN020/tp_02/exo3$ sh fils.sh 
Je suis 25826 et mon père est 25764
```
- Question 2
``` sh
#!/bin/bash
# Affiche son PID et lance dix exécutions de script fils.sh
echo $$
for num in `seq 10` 
do
    sh fils.sh
done
```
```
28620112@ssh:~/LU2IN020/tp_02/exo3$ sh pere.sh 
27721
Je suis 27723 et mon père est 27721
Je suis 27724 et mon père est 27721
Je suis 27725 et mon père est 27721
Je suis 27726 et mon père est 27721
Je suis 27727 et mon père est 27721
Je suis 27728 et mon père est 27721
Je suis 27729 et mon père est 27721
Je suis 27730 et mon père est 27721
Je suis 27731 et mon père est 27721
Je suis 27732 et mon père est 27721
```
- Question 3   
On modifie la ligne `sh fils.sh`en `pere.sh` pour devenir `./fils.sh`
```
28620112@ssh:~/LU2IN020/tp_02/exo3$ chmod u+x fils.sh pere.sh 
28620112@ssh:~/LU2IN020/tp_02/exo3$ ./pere.sh 
27839
Je suis 27841 et mon père est 27839
Je suis 27842 et mon père est 27839
Je suis 27843 et mon père est 27839
Je suis 27844 et mon père est 27839
Je suis 27845 et mon père est 27839
Je suis 27846 et mon père est 27839
Je suis 27847 et mon père est 27839
Je suis 27848 et mon père est 27839
Je suis 27849 et mon père est 27839
Je suis 27850 et mon père est 27839
```
Il n'y a pas de changement dans le nombre de processus créés.

### Exercice 4 : Scripts paramétrés
- Question 1
```sh
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
for num in `seq $1` 
do
    ./fils.sh
done
```
```
28620112@ssh:~/LU2IN020/tp_02/exo4$ ./pere.sh 
Il manque un paramètre
Usage : ././pere.sh <nb_fils>
```
- Question 2
```sh
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
```
```
28620112@ssh:~/LU2IN020/tp_02/exo4$ ./pere.sh 5
31440
Fils 1 : Je suis 31441 et mon père est 31440
Fils 2 : Je suis 31442 et mon père est 31440
Fils 3 : Je suis 31443 et mon père est 31440
Fils 4 : Je suis 31444 et mon père est 31440
Fils 5 : Je suis 31445 et mon père est 31440
```