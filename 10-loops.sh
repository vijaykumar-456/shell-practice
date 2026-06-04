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
        echo " Installation $1 .... Failed" | tee -a $LOG_FILES
        exit 1
    else
        echo " $1 installed ... Success" | tee -a $LOG_FILES
    fi
}

for package in $@
do 
    echo "Installing $package"
done


