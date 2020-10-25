#!/bin/bash
if [ $# != 1 ]; then
    echo "Il manque un paramètre"
    echo "Usage : ./$0 <dir_name>"
    exit 1
fi
if [ ! -d "$1" ]; then
    echo "err:dir not found"
    exit 1
fi
max=0
lenth=0
max_name=""
cd $1
for file_name in $(ls); do
    lenth=$(wc -c <$file_name)
    if [ $(($max)) -le $(($lenth)) ]; then
        max=$lenth
        max_name=$file_name
    fi
done
echo $max_name
