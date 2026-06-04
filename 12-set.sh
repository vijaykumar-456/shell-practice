#!bin/bash
set -e
LOG_DIR=/var/log/shell-script
LOG_FILES="$LOG_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "erro at $LINENO", command: $BASH_COMMAND"'

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " Try with Sudo access"
    exit 1

fi


for package in $@
do 
    echo "Installing $package"
    dnf list installed $package &>> LOG_FILES
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> LOG_FILES
    else
        echo -e "$TIMESTAMP [INFO] Already $package installed ...$Y SKIPPING $N" | tee -a $LOG_FILES
    fi
done


