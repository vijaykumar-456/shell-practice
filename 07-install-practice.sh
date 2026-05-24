#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "user id is not correct"
    exit 1
fi

echo "I am contuing..."

echo "Installing mysql"

dnf install mysqlddffd -y