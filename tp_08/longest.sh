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
