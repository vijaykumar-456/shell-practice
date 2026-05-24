#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "user id is not correct"
fi

echo "I am contuing..."