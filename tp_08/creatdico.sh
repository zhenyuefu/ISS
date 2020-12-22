#!/usr/bin/env bash

while read -r line; do
    echo "$line" >>dico/"${line:0:1}"
done <dico.txt
