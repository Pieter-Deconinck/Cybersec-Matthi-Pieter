#!/bin/bash


############################################
## Matthias Appelmans / Pieter Deconinck ##
############################################
##          CYBERSECURITY VM CONFIG      ##
############################################


sudo ip addr add 192.168.1.61/24 dev enp0s3

# Delete the 10.0.2.15 address if it exists
if sudo ip addr show enp0s3 | grep "10.0.2.15" > /dev/null; then
  sudo ip addr del 10.0.2.15/24 dev enp0s3
fi