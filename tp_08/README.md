# ISS - Initiation aux Systèmes d’exploitation et au Shell
## [TP 08 – Parallélisation et synchronisation avec wait](https://github.com/zhenyuefu/ISS/tree/master/tp_08) [![](https://img.shields.io/badge/ZHENYUE%20FU-28620112-blue.svg?style=social&logo=gmail)](mailto:zhenyue.fu@etu.sorbonne-universite.fr)

### Exercice 1 : AdopteUnZombie.com
- Q1
```
28620112@ppti-14-407-06:~/ISS$ sleep 30 &
[1] 7309
28620112@ppti-14-407-06:~/ISS$ ps o pid,ppid,state --pid $!
  PID  PPID S
 7309  6717 S
```
- Q3
```bash
#!/usr/bin/env bash

for _ in $(seq 60); do
    ps o pid,ppid,state --pid "$1"
    sleep 1
done
```
- Q4
```bash
#!/usr/bin/env bash

while :; do
    s=$(ps -o state "$1" | grep "Z")
    if [ "$s" = "Z" ]; then
        echo "Le processus est devenu zombie !!!"
        break
    fi
    sleep 1
done
```
### Exercice 2 : D’un coeur à l’autre
```bash
#!/usr/bin/env bash

while read -r line; do
    echo "$line" >>dico/"${line:0:1}"
done <dico.txt
```
### Exercice 3 : A plusieurs
- Q1
```bash
#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

if [ ! -r "$1" ]; then
    echo "err:can't open file $1 !"
    exit 1
fi
longest=0
while read -r line; do
    len=${#line}
    if [ $longest -lt "$len" ]; then
        longest=$len
        echo "$line" >"$1".tmp
    fi
done <"$1"
```
- Q2
```bash
#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <dirname>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "err:can't open dir $1 !"
    exit 1
fi

for file in "$1"/*; do
    ./longest.sh "$file" &
done
wait $!
longest=0
for file in "$1"/*.tmp; do
    word=$(cat "$file")
    l=${#word}
    if [ "$l" -gt $longest ]; then
        longest=$l
        longestword=$word
    fi
done
rm -f "$1"/*.tmp
echo "$longestword"
```
Le mot le plus long que nous ayons trouvé est `CINEMATOGRAPHIASSIONS`
- Q3
```
(base) zhenyue@Razer-Blade:~/ISS/tp_08$ time ./paraLongest.sh dico
CINEMATOGRAPHIASSIONS

real    0m4.545s
user    0m8.188s
sys     0m8.359s
(base) zhenyue@Razer-Blade:~/ISS/tp_08$ time ./longest.sh dico.txt 

real    0m9.109s
user    0m4.578s
sys     0m4.453s
```
- Q4
Pour le script `longest.sh`, le temps `user` + `sys` = temps `real`.
Et pour les scripts `paraLongest.sh`, la somme des deux temps est inférieure au temps réel, parce que ce script utilise plusieurs cœurs CPU.
- Q5
Nous utilisons cette formule pour représenter le taux de parallélism `(real+sys)/real`.