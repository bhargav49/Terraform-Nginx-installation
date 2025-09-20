#!/bin/bash


sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Nginx installed successfully...</h1>" > /var/www/html/index.html
