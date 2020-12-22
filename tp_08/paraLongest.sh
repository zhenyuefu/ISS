#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <dirname>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "err:can't open dir $1 !"
    exit 1
fi

for file in "$1"/*; do
    ./longest.sh "$file" &
done
wait $!
longest=0
for file in "$1"/*.tmp; do
    word=$(cat "$file")
    l=${#word}
    if [ "$l" -gt $longest ]; then
        longest=$l
        longestword=$word
    fi
done
rm -f "$1"/*.tmp
echo "$longestword"
