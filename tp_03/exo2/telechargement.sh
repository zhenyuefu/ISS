#!/bin/bash
save_dir="chunks"
if [ ! -d "$save_dir" ]; then
    mkdir $save_dir
fi
cd $save_dir
for i in {00..99}; do
    if
        [ ! -f "data.$i" ]
    then
        wget http://julien.sopena.fr/chunks/data.$i
    fi
done
