#!/bin/bash

cd home/ubuntu
sudo apt install -y apache2
systemctl enable apache2
systemctl start apache2
sudo apt update -y
# apt install mariadb-server mariadb-client
# mysql_secure_installation
# apt install php php-mysql
# cd /var/
# mkdir www
# cd /var/www/
# mkdir html
cd home/ubuntu
mkdir magento
sudo apt install software-properties-common 
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
cd home/ubuntu/magento
sudo apt install php8.1-{bcmath,common,curl,fpm,gd,intl,mbstring,mysql,soap,xml,xsl,zip,cli}
sudo sed -i "s/memory_limit = .*/memory_limit = 768M/" /etc/php/8.1/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/8.1/fpm/php.ini
sudo sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/8.1/fpm/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/8.1/fpm/php.ini

#git config --global user.email "kavya3672@gmail.com"
#git config --global kavya.lucky "kavya"
# yum install snapd -y
# yum snap install core -y
# yum snap refresh core -y
# sudo rm -rf certbot
# sudo snap install --classic certbot
# sudo ln -s /snap/bin/certbot /usr/bin/certbot
# sudo certbot --httpd
# sudo certbot certonly --apache
# sudo systemctl restart httpd
# wget http://nginx.org/download/nginx-1.0.5.tar.gz
# tar xvfz nginx-1.0.5.tar.gz
# cd nginx-1.0.5./configure
# apt install nginx -y
# systemctl enable nginx
# systemctl start nginx
# sudo amazon-linux-extras install nginx1 -y
# sudo systemctl enable nginx
# sudo systemctl start nginx
# nano /etc/nginx/sites-enabled/
