#!/bin/bash
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"
path=$(pwd)

sudo git config --global user.name $username
sudo git config --global user.email $emailaddress

if [ -d "12thDoorPaymentPortal" ]; then
	cd 12thDoorPaymentPortal
	sudo git pull
fi
sudo git clone https://github.com/DuoSoftware/12thDoorAppsV2/tree/master/12thDoorPaymentPortal
cd $path
sudo cp -r  12thDoorPaymentPortal /var/www/html/
