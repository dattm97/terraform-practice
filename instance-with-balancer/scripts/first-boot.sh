#!/bin/bash

# sudo amazon-linux-extras list | grep nginx
# sudo amazon-linux-extras enable nginx1
# sudo yum clean metadata
# sudo yum -y install nginx
# nginx -v
# sudo systemctl start nginx

sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo chmod 777 /var/www/html -R
cd /var/www/html
echo "App 01 | TESTING ONLY" > index.html