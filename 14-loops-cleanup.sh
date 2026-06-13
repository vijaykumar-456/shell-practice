#!bin/bash

SOURCE_DIR=$1
DAYS=${2:-14}

if [ -z $SOURCE_DIR ]; then
    echo "ERROR: missing parameter"
    echo "USAGE: $0 <SOURCE_DIR> [Days[Optional]]"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "ERROR: Directory:$SOURCE_DIR not exist"
    exit 1
fi

echo "Scanning $SOURCE_DIR for log files older than 14 days"
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ -z $FILES ]; then
    echo "No log files older than $DAYS found"
    echo 0
fi

while IFS= read -r FILE
do
    echo "File to be deleted: $FILE"
    rm -f $FILE
    echo "File $FILE is deleted"
done <<< "$FILES"