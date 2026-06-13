#!bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

#if two directory path not passed in the command
if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "Either source directory or destination directory are empty"
    echo "USAGE: $0 [source_dir] [dist_dir] [days: default 14 days]"
    exit 1
fi

#if source directory path not passed
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR:: source directory not defined"
    exit 1
fi

#if destination directory path not passed
if [ ! -d "$DEST_DIR" ]; then
    echo "ERROR:: destination directory not defined"
    exit 1
fi

FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS)

if [ -z "$FILES" ]; then
    echo "FILES: $FIles not found older than $DAYS"
    exit 0
fi

while IFS= read -r FILE
do
    echo "$FILE"
done <<< "$FILES"

TIMESTAMP=$(date +%y-%m-%s-%H-%M-%S)
ARCHIVE_FILES= "$DEST_DIR /logs-archive-$TIMESTAMP.tar.gz"

tar -czvf $ARCHIVE_FILES $FILES