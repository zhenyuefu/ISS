#!/usr/bin/env bash

while :; do
    s=$(ps -o state "$1" | grep "Z")
    if [ "$s" = "Z" ]; then
        echo "Le processus est devenu zombie !!!"
        break
    fi
    sleep 1
done
