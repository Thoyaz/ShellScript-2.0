#!/bin/bash

USER_INFO=$(id -u)

#verify user
if [[ $USER_INFO -ne 0 ]]; then
    echo "Please run the script as root user"
    exit 1
fi

VALIDATE(){
    if [[ $1 -ne 0 ]]; then
        echo "$2 : FAILED"
        exit 1
    else
        echo "$2 : SUCCESS"
    fi 
}

# Install nginx
echo "Installing nginx..."
sudo apt install -y nginxxs

VALIDATE $? "Nginx installation"

#install mysql
echo "Installing nginx..."
sudo apt install -y mysql-server

VALIDATE $? "Mysql installation"

#install nodejs
echo "Installing nginx..."
sudo apt install -y nodejs npm

VALIDATE $? "nodejs installation"