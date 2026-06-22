#!/bin/bash

USER_INFO=$(id -u)

#verify user
if [[ $USER_INFO -ne 0 ]]; then
    echo "Please run the script as root user"
    exit 1
fi




# Install nginx
echo "Installing nginx..."
sudo apt install -y nginx


if [[ $? -ne 0 ]]; then
    echo "Installing nginx.. : FAILED"
    exit 1
else
    echo "Installing nginx.. : SUCCESS"
fi

#install mysql
echo "Installing nginx..."
sudo apt install -y mysql-server


if [[ $? -ne 0 ]]; then
    echo "Installing nginx.. : FAILED"
    exit 1
else
    echo "Installing nginx.. : SUCCESS"
fi
#install nodejs
echo "Installing nginx..."
sudo apt install -y nodejs npm


if [[ $? -ne 0 ]]; then
    echo "Installing nginx.. : FAILED"
    exit 1
else
    echo "Installing nginx.. : SUCCESS"
fi