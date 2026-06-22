#!/bin/bash

USER_INFO=$(id -u)
LOG_FOLDER="/var/log/shell-logs"
LOG_FILE="/var/log/shell-logs/$0.log"


#verify user
if [[ $USER_INFO -ne 0 ]]; then
    echo "Please run the script as root user"
    exit 1
fi

mkdir -p /var/log/shell-logs # creates folder if not exists

VALIDATE(){
    if [[ $1 -ne 0 ]]; then
        echo "$2 : FAILED"
        exit 1
    else
        echo "$2 : SUCCESS"
    fi 
}

# Install nginx
sudo apt install -y nginx &>> $LOG_FILE 
VALIDATE $? "Nginx installation"

#install mysql
sudo apt install -y mysql-server &>> $LOG_FILE 
VALIDATE $? "Mysql installation"

#install nodejs
sudo apt install -y nodejs npm &>> $LOG_FILE 
VALIDATE $? "nodejs installation"