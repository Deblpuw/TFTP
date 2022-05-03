#!/bin/bash

sudo apt-get  update
sudo apt-get install tftpd-hpa
sudo apt-get install tftp
ip addr | grep inet |tr -d [:alpha:] |cut -d : -f2 | cut -c1-14 |tail -n 2 > ip
IP=$(cat ip)
cat /etc/default/tftpd-hpa | sed -i "s/TFTP_ADDRESS=.*/TFTP_ADDRESS=`echo $IP:69`/g" /etc/default/tftpd-hpa
sudo sed -i 's/TFTP_OPTIONS="--secure".*/TFTP_OPTIONS="--secure --create"/g' /etc/default/tftpd-hpa
sudo chown tftp:tftp /srv/tftp
sudo systemctl restart tftpd-hpa
