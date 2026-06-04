#!bin/bash
LOG_DIR=/var/log/shell-script
LOG_FILES="$LOG_DIR/$0.log"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

VALIDATE(){
     if [ $2 -ne 0 ]; then
        echo " Installation $1 .... Failed" | t -a $LOG_FILES
        exit 1
    else
        echo " $1 installed ... Success" | t -a $LOG_FILES
    fi
}

echo "I am continuing..."

dnf list installed mysql &>> $LOG_FILES

if [ $? -eq 0 ]; then
    echo " Already mysql installed ... SKIP" | t -a $LOG_FILES
else
    dnf install mysql -y &>> $LOG_FILES
    VALIDATE Mysql $?
   
fi

dnf list installed nginx &>> $LOG_FILES

if [ $? -eq 0 ]; then
    echo " Already nginx installed ... SKIP"
else
    echo " Installing Nginx ..."
    dnf install nginx -y &>> $LOG_FILES
    VALIDATE nginx $?
   
fi
