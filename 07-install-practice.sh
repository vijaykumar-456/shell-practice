#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "user id is not correct"
    exit 1
fi

echo "I am contuing..."

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "mysql is already installed ... SKIP"
else
    echo "Installing mysql"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "Installing mysql is ... FAILED"
        exit 1
    else
        echo "Installing mysql is  ... SUCCESS"
    fi
fi