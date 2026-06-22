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



#=========================
# uninstall packages

#!/bin/bash

echo "Stopping services..."
sudo systemctl stop nginx
sudo systemctl stop mysql

echo "Removing packages..."
sudo apt purge -y nginx nginx-common
sudo apt purge -y mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*
sudo apt purge -y nodejs npm

echo "Removing unused packages..."
sudo apt autoremove -y
sudo apt autoclean

echo "Removing configuration files..."
sudo rm -rf /etc/nginx
sudo rm -rf /var/www/html
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql
sudo rm -rf /var/log/mysql

echo "Removing npm cache..."
rm -rf ~/.npm
rm -rf ~/.node-gyp

echo "Uninstallation completed successfully!"