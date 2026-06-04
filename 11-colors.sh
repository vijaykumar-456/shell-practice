#!bin/bash
LOG_DIR=/var/log/shell-script
LOG_FILES="$LOG_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

VALIDATE(){
     if [ $2 -ne 0 ]; then
        echo -e "$TIMESTAMP [ERROR] Installation $1 .... $R Failed $N" | tee -a $LOG_FILES
        exit 1
    else
        echo -e "$TIMESTAMP [INFO]  installed $1...$G Success $N" | tee -a $LOG_FILES
    fi
}

for package in $@
do 
    echo "Installing $package"
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> LOG_FILES
        VALIDATE "$TIMESTAMP [INFO] Installing $package" $?
    else
        echo -e "$TIMESTAMP [INFO] Already $package installed ...$Y SKIPPING $N" | tee -a $LOG_FILES
    fi
done


