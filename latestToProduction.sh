#!/bin/bash


BuildOutPath="$PWD"
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"

git config --global user.name $username
git config --global user.email $emailaddress
if [ ! -d "DuoworldProductionReady" ]; then
	git clone https://$username:$password@github.com/DuoSoftware/DuoworldProductionReady
fi
cd DuoworldProductionReady
git pull
sudo cp -r * /var/www/html
cd ..

sudo mkdir /var/www/html/api
<<<<<<< HEAD

if [ ! -d "duoworldapi" ]; then
	git clone https://$username:$password@github.com/DuoSoftware/duoworldapi
fi
cd duoworldapi
git pull
sudo cp -r * /var/www/html/api/
cd ..


=======
git clone https://github.com/DuoSoftware/duoworldapi
cp -r duoworldapi/* /var/www/html/api



#bower install --allow-root

echo "Site Installed successfuly"
>>>>>>> origin/master
