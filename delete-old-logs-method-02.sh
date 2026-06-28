#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR=/home/tz/delete_logs
SCRIPT_LOGS="$LOGS_DIR/$(basename "$0").log"

if [ ! $LOGS_DIR ]; then
    echo " $R $LOGS_DIR Log folder does not exists $N"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name '*.log' -type f -mtime +14)

if [ -z "$FILES_TO_DELETE" ]; then
    echo "$R Logs files olderthan 14 days was not exist $N"
    else
        while IFS= read -r filepath; do
            echo "Deleting file...$filepath"
            rm -f $filepath
            echo "$G Deleted file...$filepath $N"
        done <<< $FILES_TO_DELETE
fi