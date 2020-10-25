#!/bin/bash
cd fenetre_sur_coquillage
for filename in $(ls); do
    ../cesar 16 <$filename >>../news.txt
done
