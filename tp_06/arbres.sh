#!/usr/bin/env bash

filename=$1
res=$(cut -d ';' -f 8 "$filename" | sort | uniq -c | sort -n | tail -1)
echo "$res"
