# ISS - Initiation aux Systèmes d’exploitation et au Shell
## [TP 06 – Édition automatisée](https://github.com/zhenyuefu/ISS/tree/master/tp_06) [![](https://img.shields.io/badge/ZHENYUE%20FU-28620112-blue.svg?style=social&logo=gmail)](mailto:zhenyue.fu@etu.sorbonne-universite.fr)

### Exercice 1 : Connaître son système, le retour
- Q1
```
28620112@ppti-14-407-06:~/ISS$ sed -E -n '/([0-9]{1,3}.){3}[0-9]{1,3}.localhost$/p' /etc/hosts
127.0.0.1       localhost
```
- Q2
```
28620112@ppti-14-407-06:~/ISS$ lpoptions -l | sed -n "s/\(.*:\).*\(\*\w*\).*/\1\2/p"
PageSize/Page Size:*A4
Resolution/Resolution:*default
InputSlot/Media Source:*Tray2
Duplex/Double-Sided Printing:*None
PreFilter/GhostScript pre-filtering:*No
```
- Q3
```
28620112@ppti-14-407-06:~/ISS$ ip -4 addr | sed -n "/.*eth[0-9].*/p"
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    inet 132.227.113.230/27 brd 132.227.113.255 scope global noprefixroute eth0
4: eth0.2090@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    inet 10.9.0.111/24 brd 10.9.0.255 scope global noprefixroute eth0.2090
```
- Q4
```
(base) zhenyue@Razer-Blade:~/ISS$ groups
zhenyue adm cdrom sudo dip plugdev
(base) zhenyue@Razer-Blade:~/ISS$ sed -n "/`whoami`/p" /etc/group
adm:x:4:zhenyue
cdrom:x:24:zhenyue
sudo:x:27:zhenyue
dip:x:30:zhenyue
plugdev:x:46:zhenyue
zhenyue:x:1000:
```
- Q5

- Q6
```
28620112@ppti-14-407-06:~/ISS$ sed -n "s/\(.*\)\\b\([1-9]\|[0-9]\{2,3\}\|10[0-1][0-9]\|102[1-4]\)\/.*#\(.*\)/\1:\3/p" /etc/services
tcpmux          : TCP port service multiplexer
msp             : message send protocol
ssh             : SSH Remote Login Protocol
rlp             : resource location
nameserver      : IEN 116
tacacs          : Login Host Protocol (TACACS)
domain          : Domain Name Server
gopher          : Internet Gopher
http            : WorldWideWeb HTTP
kerberos        : Kerberos v5
kerberos        : Kerberos v5
iso-tsap        : part of ISODE
acr-nema        : Digital Imag. & Comm. 300
pop3            : POP version 3
sunrpc          : RPC 4.0 portmapper
nntp            : USENET News Transfer Protocol
ntp             : Network Time Protocol
epmap           : DCE endpoint resolution
netbios-ns      : NETBIOS Name Service
netbios-dgm     : NETBIOS Datagram Service
netbios-ssn     : NETBIOS session service
imap2           : Interim Mail Access P 2 and 4
snmp            : Simple Net Mgmt Protocol
snmp-trap       : Traps for SNMP
cmip-man        : ISO mgmt over IP (CMOT)
mailq           : Mailer transport queue for Zmailer
xdmcp           : X Display Mgr. Control Proto
nextstep        : NeXTStep window
nextstep        :  server
bgp             : Border Gateway Protocol
irc             : Internet Relay Chat
smux            : SNMP Unix Multiplexer
at-rtmp         : AppleTalk routing
at-nbp          : AppleTalk name binding
at-echo         : AppleTalk echo
at-zis          : AppleTalk zone information
qmtp            : Quick Mail Transfer Protocol
z3950           : NISO Z39.50 database
ipx             : IPX
pawserv         : Perf Analysis Workbench
zserv           : Zebra server
fatserv         : Fatmen Server
rpc2portmap     : Coda portmapper
codaauth2       : Coda authentication server
ulistserv       : UNIX Listserv
ldap            : Lightweight Directory Access Protocol
imsp            : Interactive Mail Support Protocol
svrloc          : Server Location
https           : http protocol over TLS/SSL
snpp            : Simple Network Paging Protocol
microsoft-ds    : Microsoft Naked CIFS
submissions     : Submission over TLS [RFC8314]
saft            : Simple Asynchronous File Transfer
isakmp          : IPsec - Internet Security Association
isakmp          :  and Key Management Protocol
rtsp            : Real Time Stream Control Protocol
nqs             : Network Queuing system
npmp-local      : npmp-local / DQS
npmp-gui        : npmp-gui / DQS
hmmp-ind        : HMMP Indication / DQS
asf-rmcp        : ASF Remote Management and Control Protocol
ipp             : Internet Printing Protocol
shell           : no passwords used
printer         : line printer spooler
route           : RIP
netwall         : for emergency broadcasts
gdomap          : GNUstep distributed objects
uucp            : uucp daemon
klogin          : Kerberized `rlogin' (v5)
kshell          : Kerberized `rsh' (v5)
afpovertcp      : AFP over TCP
remotefs        : Brunhoff remote filesystem
nntps           : NNTP over SSL
submission      : Submission [RFC4409]
ldaps           : LDAP over SSL
tinc            : tinc control port
kerberos-adm    : Kerberos `kadmin' (v5)
webster         : Network dictionary
domain-s        : DNS over TLS [RFC7858]
domain-s        : DNS over DTLS [RFC8094]
ftps-data       : FTP over SSL (data)
telnets         : Telnet over SSL
imaps           : IMAP over SSL
pop3s           : POP-3 over SSL
rtmp            : Routing Table Maintenance Protocol
nbp             : Name Binding Protocol
echo            : AppleTalk Echo Protocol
zip             : Zone Information Protocol
kerberos4       : Kerberos (server)
kerberos-master : Kerberos authentication
passwd-server   : Kerberos passwd server
krb-prop        : Kerberos slave propagation
krbupdate       : Kerberos registration
swat            : swat
supfilesrv      : SUP server
poppassd        : Eudora
moira-db        : Moira database
moira-update    : Moira update protocol
moira-ureg      : Moira user registration
spamd           : spamassassin daemon
omirr           : online mirror
customs         : pmake customs server
```
### Exercice 2 : Des données à scripter librement
-Q1
```bash
#!/usr/bin/env bash
filename=$1
tag=numbikesavailable
listnb=$(sed 's/,/\n/g' "$filename" | grep "$tag" | sed 's/:/\n/g' | sed '1~2d')
nbbike=0
for num in $listnb; do
    nbbike=$((nbbike + num))
done
echo "$nbbike"
```
```
(base) zhenyue@Razer-Blade:~/ISS/tp_06$ sh nbbike.sh velib-disponibilite-en-temps-reel.json 
17125
```
-Q2
```bash
#!/usr/bin/env bash

filename=$1
res=$(cut -d ';' -f 8 "$filename" | sort | uniq -c | sort -n | tail -1)
echo "$res"
```
```
(base) zhenyue@Razer-Blade:~/ISS/tp_06$ sh arbres.sh arbresremarquablesparis.csv 
     28 PARIS 16E ARRDT
```