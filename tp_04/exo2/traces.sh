#!/usr/bin/env bash

function usage() {
    echo "Usage: $0 <name_ficher>"
    exit 1
}
if [ $# -eq 0 ]; then
    echo needs a argument
    usage
fi
if [ ! -r "$1" ]; then
    echo "$1 is unreadable"
fi

grep -v "^$" "$1" | head -n -1 | wc -l

username=$(whoami)
lastconnected=$(head -n 1 "$1" | cut -d ' ' -f 1)
if [ "$username" == "$lastconnected" ]; then
    echo "You are the last one connected"
else
    echo "You are not the last one connected"
fi
nb=$(cut -d ' ' -f 1 "$1" | grep -c "$username")
echo "You have $nb connections"
nb_users=$(cut -d ' ' -f 1 "$1" | sort | uniq | wc -l)
echo "$nb_users users connected at least once"
nb_distant=$(awk -F' ' '{print $NF}' "$1" | grep -c -v -E "0.0.0.0|localhost")
echo "$nb_distant connections are remote"
echo "list connect remote:"
awk -F' ' '{print $NF}' "$1" | grep -v -E "^$|0.0.0.0|localhost" | head -n -1 | sort | uniq
