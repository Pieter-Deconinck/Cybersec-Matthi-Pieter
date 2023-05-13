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
sudo ip addr flush dev enp0s3
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
sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'Matthias'@'localhost' IDENTIFIED BY 'finalfantasy';"


## 2ND TRY VANAF HIER##
# Configure/install WordPress   

sudo apt install wordpress curl mariadb -y


#Mariadb secure install

sudo mysql_secure_installation

# create virtual host for wordpress


APACHE_LOG_DIR="/var/log/apache2"

cat <<EOF > /etc/apache2/sites-available/wp.conf
<VirtualHost *:80>
            ServerName localhost
    DocumentRoot /usr/share/wordpress
    Alias /wp-content /var/lib/wordpress/wp-content
    <Directory /usr/share/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /var/lib/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF

# disable default virtual host and enable the site

sudo a2dissite 000-default
sudo a2ensite wp


# Reload webserver

sudo service apache2 reload

# WordPress searches in the above order and uses the first configuration file it can find. The domain name is taken 
#from the HTTP-Request of your browser. That way you may be able to define different configuration files for different domains you are hosting.

sudo bash -c 'cat > /etc/wordpress/config-myblog.example.com.php 
<<EOF
<?php
define("DB_NAME", "wordpress");
define("DB_USER", "wordpress");
define("DB_PASSWORD", "Matthias");
define("DB_HOST", "localhost");
define("WP_CONTENT_DIR", "/var/lib/wordpress/wp-content");
?>
EOF'


# perms

sudo chown www-data:www-data /etc/wordpress/config-myblog.example.com.php
sudo chmod 640 /etc/wordpress/config-myblog.example.com.php


# Create a file to hold the database creation instructions

sudo touch ~/wp.sql



# Add the following lines to the file 


cat > ~/wp.sql <<EOF
CREATE DATABASE wordpress;
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EOF



cat ~/wp.sql | mysql --defaults-extra-file=/etc/mysql/debian.cnf
