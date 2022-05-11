#!/bin/bash

sudo apt-get update
sudo apt-get install tftpd-hpa
sudo apt-get install tftp
ip a  | grep -w inet | awk '{print $2}' | grep -v 127.0.0.1 | sed 's/\/.*//g' > ip
IP=$(cat ip)
DOC="/etc/default/tftpd-hpa"
cat $DOC | sed -i 's/TFTP_ADDRESS=.*/TFTP_ADDRESS="'"echo $IP:69"'"/g' $DOC
sudo sed -i 's/TFTP_OPTIONS="--secure".*/TFTP_OPTIONS="--secure --create"/g' $DOC
sudo chown tftp:tftp /srv/tftp
sudo systemctl restart tftpd-hpa
