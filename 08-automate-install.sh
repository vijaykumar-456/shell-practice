#!bin/bash

$USERID=$(id -u)

if [ $USER -eq 0 ]; then
    echo " Try with Sudo access"
    exit 1

echo "I am continuing..."
