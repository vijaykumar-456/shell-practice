#!bin/bash

$USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

echo "I am continuing..."
