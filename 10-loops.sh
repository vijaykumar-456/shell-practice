#!bin/bash
LOG_DIR=/var/log/shell-script
LOG_FILES="$LOG_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi

VALIDATE(){
     if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [ERROR] Installation $1 .... Failed" | tee -a $LOG_FILES
        exit 1
    else
        echo "$TIMESTAMP [INFO]  installed $1... Success" | tee -a $LOG_FILES
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
        echo "$TIMESTAMP [INFO] Already $package installed ... SKIPPING" | tee -a $LOG_FILES
    fi
done


