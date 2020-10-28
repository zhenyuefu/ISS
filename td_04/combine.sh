#!/bin/bash
[ $# -ne 1 ] && echo "Il faut un param !" && exit 1
[ ! -f $1 ] && echo "Il faut un fichier en param !" && exit 1

./numerotation.sh < $1 | ./majuscule.sh

# tmp=$1.tmp
# echo $tmp

# ./numerotation.sh < $1 > $tmp 
# ./majuscule.sh < $tmp

# rm -f $tmp