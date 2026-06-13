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