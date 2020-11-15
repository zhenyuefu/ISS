# ISS - Initiation aux Systèmes d’exploitation et au Shell
## [TP 05 – Les expressions régulières](https://github.com/zhenyuefu/ISS/tree/master/tp_05) [![](https://img.shields.io/badge/ZHENYUE%20FU-28620112-blue.svg?style=social&logo=gmail)](mailto:zhenyue.fu@etu.sorbonne-universite.fr)

### Exercice 1 : Connaître son système
- Q1
```
28620112@ppti-14-407-06:~/ISS$ grep -E "([0-9]{1,3}.){3}[0-9]{1,3}" /etc/hosts
127.0.0.1       localhost
127.0.1.1       ppti-14-407-06.ufr-info-p6.jussieu.fr   ppti-14-407-06
```
- Q2
```
28620112@ppti-14-407-06:~/ISS$ lpoptions -l | grep -oE ".*:|\*\w*"
PageSize/Page Size:
*A4
Resolution/Resolution:
*default
InputSlot/Media Source:
*Tray2
Duplex/Double-Sided Printing:
*None
PreFilter/GhostScript pre-filtering:
*No
```
- Q3
```
28620112@ppti-14-407-06:~/ISS$ ip -4 addr | grep -E "eth[0-9]"
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    inet 132.227.113.230/27 brd 132.227.113.255 scope global noprefixroute eth0
4: eth0.2090@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    inet 10.9.0.111/24 brd 10.9.0.255 scope global noprefixroute eth0.2090
```
- Q4
Sur le ppti, je n'arrive pas à obtenir les résultats de `groups`
```
28620112@ppti-14-407-06:~/ISS$ groups
groups: impossible de trouver le nom pour le GID 28620112
```
Mais sur mon ordinateur local, j'obtiens les résultats suivants:
```
zhenyue@Razer-Blade:~/ISS$ cat /etc/group | grep `whoami`
adm:x:4:zhenyue
cdrom:x:24:zhenyue
sudo:x:27:zhenyue
dip:x:30:zhenyue
plugdev:x:46:zhenyue
zhenyue:x:1000:
zhenyue@Razer-Blade:~/ISS$ groups
zhenyue adm cdrom sudo dip plugdev
```
- Q5
```
28620112@ppti-14-407-06:~/ISS$ df | sort -nk 4
Sys. de fichiers                           blocs de 1K   Utilisé Disponible Uti% Monté sur
tmpfs                                             5120         4       5116   1% /run/lock
/dev/sda1                                       661504     56044     605460   9% /boot/efi
tmpfs                                          3276556      9612    3266944   1% /run
tmpfs                                          3276556         4    3276552   1% /run/user/117
tmpfs                                          3276556         0    3276556   0% /run/user/28620112
udev                                          16362956         0   16362956   0% /dev
tmpfs                                         16382780         0   16382780   0% /dev/shm
tmpfs                                         16382780         0   16382780   0% /sys/fs/cgroup
fs-etu2.ufr-info-p6.jussieu.fr:/dsk/Etu2/o  1031069696 288236544  690387968  30% /users/nfs/Etu2
/dev/sdb2                                   1860284860  87890276 1677827468   5% /
```
```
28620112@ppti-14-407-06:~/ISS$ df | sort -nk 4 | tail -n 1 | tr -s ' ' ':' | cut -d : -f 6
/
```