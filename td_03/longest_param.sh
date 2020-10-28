#!/bin/bash
max_size=0
for para in '$@'; do
    if [${#para} -gt $max_size ]; then
        max_size=${#para}
        res = $para
    fi
done
if [ ${max_size} -gt 0 ]; then
    echo $res
fi
