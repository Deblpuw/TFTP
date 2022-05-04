#!/bin/bash

sudo apt-get  update
sudo apt-get install tftpd-hpa
sudo apt-get install tftp
ip addr | grep inet |tr -d [:alpha:]|tr -s [:space:]|cut -d : -f2 | cut -c1-13 |tail -n 2 > ip
IP=$(cat ip)
DOC="/etc/default/tftpd-hpa"
cat $DOC | sed -i 's/TFTP_ADDRESS=.*/TFTP_ADDRESS="'"echo $IP:69"'"/g' $DOC
sudo sed -i 's/TFTP_OPTIONS="--secure".*/TFTP_OPTIONS="--secure --create"/g' /etc/default/tftpd-hpa
sudo chown tftp:tftp /srv/tftp
sudo systemctl restart tftpd-hpa
