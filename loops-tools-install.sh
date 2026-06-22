#!/bin/bash

USER_INFO=$(id -u)
LOG_FOLDER="/var/log/shell-logs"
LOG_FILE="/var/log/shell-logs/$0.log"
LIST_OF_PACKAGES=(
    "nginx"
    "mysql-server"
    "nodejs npm"
)

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

for i in "${LIST_OF_PACKAGES[@]}"
do
    echo "Installing $i..."
    sudo apt install -y $i &>> $LOG_FILE
    VALIDATE $? "Installation of $i"
done