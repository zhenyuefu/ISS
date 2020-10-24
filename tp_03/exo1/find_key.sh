#!/bin/bash
for num in $(seq 1 26)
do
    echo -n $num:
    ./cesar $num < fenetre_sur_coquillage/part1
done