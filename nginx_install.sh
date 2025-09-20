#!/bin/bash


sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Nginx installed successfully...</h1>" > /var/www/html/index.html
sudo systemctl status nginx
