#!bin/bash

TIMESTAMP=$(date)

echo " Current Time is : $TIMESTAMP"

# calculate start and end time

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

echo "execution time is: $END_TIME-$START_TIME"

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo " Script executed in: $TOTAL_TIME seconds"
