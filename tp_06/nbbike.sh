#!/usr/bin/env bash
filename=$1
tag=numbikesavailable
listnb=$(sed 's/,/\n/g' "$filename" | grep "$tag" | sed 's/:/\n/g' | sed '1~2d')
nbbike=0
for num in $listnb; do
    nbbike=$((nbbike + num))
done
echo "$nbbike"
