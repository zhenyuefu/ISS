#! /bin/bash
var="val_de_a"
echo "A: $var"
source B.sh
echo "A: $var"
./C.sh
echo "A: $var"
