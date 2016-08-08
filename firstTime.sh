#!/bin/bash


BuildOutPath="$PWD"
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"

if [ "$1" = "-i" ]; then
	apt-get update
	#apt-get install -y python-software-properties  # 12.04
	#add-apt-repository ppa:duh/golang
	sudo apt-get install -y python-software-properties python g++ make
	sudo add-apt-repository ppa:chris-lea/node.js
	sudo apt-get update
	#sudo apt-get install golang
	sudo apt-get install -y nodejs nodejs-legacy  apache2 php5 php5-curl
	sudo apt-get update
	sudo apt-get install -y npm
	sudo npm install -g bower
fi

#nodejs 
git config --global user.name $username
git config --global user.email $emailaddress
echo "BEGIN REPO PULL Duoworldsite"
if [ ! -d "Duoworldsite" ]; then
#mkdir "depo"
#cd depo
git clone https://$username:$password@github.com/DuoSoftware/Duoworldsite
#cd ../
fi
cd Duoworldsite
git pull
sudo cp -r * /var/www/html
cd ..

git clone https://github.com/DuoSoftware/DW-Shell-Default-Config
cd DW-Shell-Default-Config
git pull
sudo mkdir /var/www/html/dwbording
cp -r * /var/www/html/dwbording/
cd ..

git clone https://$username:$password@github.com/DuoSoftware/DW-alpha-shell.git
cd DW-alpha-shell
git pull
mkdir /var/www/html/shell
cp -r * /var/www/html/shell/
cd ..

cd /var/www/html
bower install --allow-root

echo "Site Installed successfuly"