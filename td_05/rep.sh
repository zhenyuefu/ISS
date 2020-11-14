#!/usr/bin/env bash
grep -E "^.{15}$" dico.txt >15.tmp
for mot in $(grep -E "^.{8}$" dico.txt); do
    grep -E "$mot" 15.tmp
done
