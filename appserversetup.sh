#!/bin/bash
#$1 main domain

RED='\033[0;31m'

if [ -z "$1" ];then
	echo "${RED}please provide main domain. Eg: ./appinstall.sh duoworld.com${NC}\n"
else
BuildOutPath="$PWD"
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"

git config --global user.name $username
git config --global user.email $emailaddress

echo "BEGIN REPO PULL Duoworldsite"
if [ ! -d "Duoworldsite" ]; then
	git clone https://$username:$password@github.com/DuoSoftware/Duoworldsite.git
fi
cd Duoworldsite
git pull
sudo cp -r apps include apis payapi /var/www/html
cd ..

if [ ! -d "duoworldDefaultApps" ];then 
	git clone https://$username:$password@github.com/DuoSoftware/duoworldDefaultApps.git
fi
cd duoworldDefaultApps
git pull 
sudo mkdir /var/media
sudo mkdir /var/media/$1

cp -r * /var/media/$1/

chgrp -R www-data /var/media
chown -R www-data /var/media
chmod -R 0777 /var/media

fi
