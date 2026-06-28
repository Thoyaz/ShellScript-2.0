#!/bin/bash

R="\e[31M"
G="\e[32M"
Y="\e[33M"
N="\e[0M"

LOGS_DIR=/home/tz/delete_logs
SCRIPT_LOGS="$LOGS_DIR/$(basename "$0").log"

if [ ! $LOGS_DIR ]; then
    echo "$LOGS_DIR Log folder does not exists"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name '*.log' -type f -mtime +14)

if [ -z $FILES_TO_DELETE ]; then
    echo "Logs files olderthan 14 days was not exist"
else
    while IFS=read -r filepath; do
        echo "Deleting file...$filepath"
        rm -rf $filepath
        echo "Deleted file...$filepath"
    done <<< $FILES_TO_DELETE
fi