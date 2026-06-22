#!/bin/bash

USER_INFO=$(id -u)
LOG_FOLDER="/var/log/shell-logs"
LOG_FILE="/var/log/shell-logs/$0.log"

#verify user
if [[ $USER_INFO -ne 0 ]]; then
    echo "Please run the script as root user" | tee -a $LOG_FILE
    exit 1
fi

mkdir -p /var/log/shell-logs # creates folder if not exists

VALIDATE(){
    if [[ $1 -ne 0 ]]; then
        echo "$2 : FAILED" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 : SUCCESS" | tee -a $LOG_FILE
    fi 
}

for package in "$@"
do

    if command -v $package &>> $LOG_FILE
    then
        exit 0
    fi

    echo "Installing $package..."
    sudo apt install -y $package &>> $LOG_FILE
    VALIDATE $? "Installation of $package"
done