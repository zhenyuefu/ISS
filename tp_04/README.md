# ISS - Initiation aux Systèmes d’exploitation et au Shell
## [TP 04 – Combinaison de commandes avec les tubes](https://github.com/zhenyuefu/ISS/tree/master/tp_04) [![](https://img.shields.io/badge/ZHENYUE%20FU-28620112-blue.svg?style=social&logo=gmail)](mailto:zhenyue.fu@etu.sorbonne-universite.fr)

### Exercice 1 : What does the Tux say ?
```bash
#!/bin/bash

read -r -p "VF or VO:" para

while IFS=, read -r name f o; do
    if [ "$para" = "VF" ]; then
        cowsay -f "$name" "$f"
    fi
    if [ "$para" = "VO" ]; then
        cowsay -f "$name" "$o"
    fi
done <blabla.csv
```
### Exercice 2 : Sur vos traces
- Q1
```bash
last -da >connexions.log
```
- Q2
```bash
function usage() {
    echo "Usage: $0 <name_ficher>"
    exit 1
}
if [ $# -eq 0 ]; then
    echo needs a argument
    usage
fi
if [ ! -r "$1" ]; then
    echo "$1 is unreadable"
fi
```
- Q3
```bash
grep -v "^$" "$1" | head -n -1 | wc -l
```
- Q4
```bash
username=$(whoami)
lastconnected=$(head -n 1 "$1" | cut -d ' ' -f 1)
if [ "$username" == "$lastconnected" ]; then
    echo "You are the last one connected"
else
    echo "You are not the last one connected"
fi
```
- Q5
```bash
nb=$(cut -d ' ' -f 1 "$1" | grep -c "$username")
echo "You have $nb connections"
```
- Q6
```bash
nb_users=$(cut -d ' ' -f 1 "$1" | sort | uniq | wc -l)
echo "$nb_users users connected at least once"
```
- Q7
```bash
nb_distant=$(awk -F' ' '{print $NF}' "$1" | grep -c -v -E "0.0.0.0|localhost")
echo "$nb_distant connections are remote"
```
- Q8
```bash
echo "list connect remote:"
awk -F' ' '{print $NF}' "$1" | grep -v -E "^$|0.0.0.0|localhost" | head -n -1 | sort | uniq
```
```
28620112@ssh:~/ISS/tp_04/exo2$ bash traces.sh connexions.log 
123
You are the last one connected
You have 4 connections
18 users connected at least once
11 users are remotely connected
list connect remote:
deb-serv2.ufr-info-p6.jussieu.fr
tarentule1.ufr-info-p6.jussieu.fr
```
- Q9
Parce que l'ordinateur du ppti ne peut pas se connecter directement à Internet.
- Q12
```
28620112@ssh:~/ISS/tp_04/exo2$ bash traces.sh connex_ssh.log 
173
You are not the last one connected
You have 3 connections
57 users connected at least once
175 users are remotely connected
list connect remote:
104.81.14.109.rev.sfr.net
117.12.23.93.rev.sfr.net
124.168.11.109.rev.sfr.net
12.98.14.109.rev.sfr.net
131.12.23.93.rev.sfr.net
135.97.14.109.rev.sfr.net
140.186.0.93.rev.sfr.net
147.79.21.93.rev.sfr.net
176-132-208-231.abo.bbox.fr
176-151-229-29.abo.bbox.fr
176-159-52-116.abo.bbox.fr
178.20.50.11
20.39.22.93.rev.sfr.net
212.110.137.88.rev.sfr.net
213-245-190-226.rev.numericable.fr
213.73.31.93.rev.sfr.net
245.151.153.77.rev.sfr.net
37.165.210.30
37.165.231.71
37.165.239.215
37.171.56.50
37.171.98.135
37.172.7.77
37.172.79.222
37.173.22.253
56.177.84.79.rev.sfr.net
78.192.16.97
78.193.146.151
78.194.58.113
78.250.206.194
80.215.203.239
80.215.70.108
81-67-16-216.rev.numericable.fr
82.216.207.77.rev.sfr.net
83.159.72.241
88.126.173.89
88.126.51.214
91-170-190-116.subs.proxad.net
94.200.30.93.rev.sfr.net
aaubervilliers-654-1-79-203.w86-212.abo.wanadoo.fr
arl95-h11-31-33-138-12.dsl.sta.abo.bbox.fr
dvv62-h01-176-151-229-29.dsl.sta.abo.bbox.fr
eth-east-parth2-46-193-65-96.wb.wifirst.net
eth-east-parth2-46-193-66-115.wb.wifirst.net
eth-east-parth2-46-193-66-222.wb.wifirst.net
eth-east-parth2-46-193-66-248.wb.wifirst.net
eth-east-parth2-46-193-67-56.wb.wifirst.net
eth-west-pareq2-46-193-1-240.wb.wifirst.net
eth-west-pareq2-46-193-3-148.wb.wifirst.net
lag77-1-82-238-104-48.fbx.proxad.net
lfbn-bor-1-1069-bdcst.w90-120.abo.wanadoo.fr
lfbn-idf1-1-2071-187.w90-127.abo.wanadoo.fr
lfbn-idf1-1-587-227.w86-242.abo.wanadoo.fr
lfbn-idf2-1-136-13.w83-202.abo.wanadoo.fr
lfbn-idf2-1-167-130.w83-202.abo.wanadoo.fr
lfbn-idf2-1-7-152.w83-202.abo.wanadoo.fr
lfbn-idf2-1-830-175.w86-247.abo.wanadoo.fr
lfbn-idf3-1-768-59.w86-252.abo.wanadoo.fr
lfbn-mon-1-792-127.w86-227.abo.wanadoo.fr
lfbn-ncy-1-980-13.w90-101.abo.wanadoo.fr
lns-bzn-32-82-254-27-168.adsl.proxad.net
lns-bzn-32-82-254-39-128.adsl.proxad.net
lns-bzn-36-82-251-54-237.adsl.proxad.net
lns-bzn-56-82-255-203-36.adsl.proxad.net
lon92-7-82-245-119-62.fbx.proxad.net
pop.92-184-116-131.mobile.abo.orange.fr
roc37-h01-176-170-197-49.dsl.sta.abo.bbox.fr
tarentule1.ufr-info-p6.jussieu.fr
```
