#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

echo "I am continuing..."

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo " Already mysql installed ... SKIP"
else
    dnf install mysql -y
    if [ $? -ne 0]; then
        echo " Installation Failed .... Failed"
        exit 1
    else
        echo " Mysql installed ... Success"
    fi
fi
