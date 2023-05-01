#!/bin/bash


############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##          CYBERSECURITY VM CONFIG      ##
############################################


# Set the IP address of the enp0s3 interface to 192.168.1.60
sudo ip addr add 192.168.1.60/24 dev enp0s3

# Delete the 10.0.2.15 address if it exists
if sudo ip addr show enp0s3 | grep "10.0.2.15" > /dev/null; then
  sudo ip addr del 10.0.2.15/24 dev enp0s3
fi

# Configure the network interface to use a static IP address
sudo tee /etc/network/interfaces > /dev/null <<EOT
auto lo
iface lo inet loopback

auto enp0s3
iface enp0s3 inet static
  address 192.168.1.60
  netmask 255.255.255.0
EOT

# Restart the networking service
sudo systemctl restart networking

# Install Apache2
sudo apt-get update
sudo apt-get install -y apache2

# Download and extract Wordpress 5.0.0
wget https://wordpress.org/wordpress-5.0.tar.gz
tar -xzvf wordpress-5.0.tar.gz -C /var/www/html/
sudo mv wordpress /var/www/html/
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress

# Create MySQL database and user for WordPress
sudo mysql -u root -p -e "CREATE DATABASE wordpress;"
sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'finalfantasy';"

# Configure WordPress
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/username_here/wordpressuser/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/password_here/finalfantasy/" /var/www/html/wordpress/wp-config.php

# Update Apache configuration
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/wordpress.conf
sudo sed -i "s|DocumentRoot /var/www/html|DocumentRoot /var/www/html/wordpress|" /etc/apache2/sites-available/wordpress.conf
sudo sed -i "s/ServerAdmin webmaster@localhost/ServerAdmin admin@example.com/" /etc/apache2/sites-available/wordpress.conf
sudo sed -i "s|<Directory /var/www/html>|<Directory /var/www/html/wordpress/>|" /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo systemctl restart apache2