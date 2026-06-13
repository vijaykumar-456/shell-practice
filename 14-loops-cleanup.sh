#!bin/bash

SOURCE_DIR=$1
DAYS=${2:-14}

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -z "$SOURCE_DIR" ]; then
    echo "ERROR: missing parameter"
    echo "USAGE: $0 <SOURCE_DIR> [Days[Optional]]"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Directory:$SOURCE_DIR not exist"
    exit 1
fi

echo "Scanning $SOURCE_DIR for log files older than 14 days"
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ -z "$FILES" ]; then
    echo -e "$R No log files older than $N $Y $DAYS $N found"
    exit 0
fi

while IFS= read -r FILE
do
    echo -e "File to be deleted: $Y $FILE $N"
    rm -f "$FILE"
    echo -e "File $R $FILE $N is $ $G deleted $N "
done <<< "$FILES"