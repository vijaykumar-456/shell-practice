#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

VALIDATE(){
     if [ $2 -ne 0]; then
        echo " Installation $1 .... Failed"
        exit 1
    else
        echo " $1 installed ... Success"
    fi
}

echo "I am continuing..."

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo " Already mysql installed ... SKIP"
else
    dnf install mysql -y
    VALIDATE Mysql $?
   
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo " Already nginx installed ... SKIP"
else
    echo " Installing Nginx ..."
    dnf install nginx -y
    VALIDATE nginx $?
   
fi
