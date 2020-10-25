#!/bin/bash
if [ ! -d "sélection" ]; then
    mkdir sélection
fi
cd dico
for i in $(seq 4); do
    mv $(bash ../biggest.sh ../dico) ../sélection
done
