#!/bin/bash
nbG=$(cut -d ' ' -f 3 notes.lst | tail -n +2 | grep G | wc -l)
nbF=$(cut -d ' ' -f 3 notes.lst | tail -n +2 | grep G | wc -l)
echo $nbG
echo $nbF