#!bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS={3:-14}

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
if [ ! -d "$DIST_DIR" ]; then
    echo "ERROR:: destination directory not defined"
    exit 1
fi