#!bin/bash

TIMESTAMP=$(date)

echo " Current Time is : $TIMESTAMP"

# calculate start and end time

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

echo "execution time is: $START_TIME - $END_TIME"

TOTAL_TIME = $(($START_TIME - $END_TIME))

echo " Script executed in: $TOTAL_TIME seconds"
