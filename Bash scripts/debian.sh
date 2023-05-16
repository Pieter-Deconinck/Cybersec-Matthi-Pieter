#!/bin/bash


############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##          CYBERSECURITY VM CONFIG      ##
############################################


sudo apt update -y
sudo apt install apache2 mariadb-server php php-mysql php-fpm libapache2-mod-php -y  
sudo apt install php-xml -y


echo "source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto enp0s8
iface enp0s8 inet static
    address 192.168.1.60" > /etc/network/interfaces

sudo sed -i 's/nameserver.*/nameserver 8.8.8.8/' /etc/resolv.conf
sudo sed -i '/\[main\]/a dns=none' /etc/NetworkManager/NetworkManager.conf
sudo systemctl restart networking
sudo systemctl restart NetworkManager

sudo mysqladmin password "Pieter"

mysql --user=root -p"Pieter" <<_EOF_
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
_EOF_

mysql --user=root -p"Pieter" <<_EOF_ 
CREATE DATABASE wordpress_DB;  
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'password';  
GRANT ALL PRIVILEGES ON wordpress_DB.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';  
FLUSH PRIVILEGES;  
_EOF_

sudo wget https://wordpress.org/wordpress-5.0.tar.gz  
tar -xvzf wordpress-5.0.tar.gz  
sudo rm -rf /var/www/html/wordpress
sudo mv wordpress /var/www/html/wordpress  
sudo chown -R www-data:www-data /var/www/html/wordpress/  
sudo chmod -R 755 /var/www/html/wordpress/  
sudo sed -i '/DocumentRoot \/var\/www\/html/c\DocumentRoot /var/www/html/wordpress' /etc/apache2/sites-enabled/000-default.conf


sudo a2enmod php7.4
sudo systemctl restart apache2  

sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/'DB_NAME', 'database_name_here'/'DB_NAME', 'wordpress_DB'/g" /var/www/html/wordpress/wp-config.php
sed -i "s/'DB_USER', 'username_here'/'DB_USER', 'wordpress_user'/g" /var/www/html/wordpress/wp-config.php
sed -i "s/'DB_PASSWORD', 'password_here'/'DB_PASSWORD', 'password'/g" /var/www/html/wordpress/wp-config.php

echo "Script completed you may now access localhost and configure wordpress"