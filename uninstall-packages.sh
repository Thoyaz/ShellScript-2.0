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