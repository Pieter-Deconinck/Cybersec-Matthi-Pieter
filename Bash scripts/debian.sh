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