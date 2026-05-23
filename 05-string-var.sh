#!bin/bash

NUM1=10
NUM2=20

SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"

#Array
MOVIES=("RRR" "Varanasi" "Pushpa")
echo " Movies are: ${MOVIES[@]}"
echo " First are: ${MOVIES[0]}"
echo " Second are: ${MOVIES[1]}"
echo " Third are: ${MOVIES[2]}"