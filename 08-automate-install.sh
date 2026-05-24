#!bin/bash

$USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

echo "I am continuing..."
