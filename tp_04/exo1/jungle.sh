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
