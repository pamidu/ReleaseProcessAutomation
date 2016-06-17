#!/bin/bash
#username="duobuilduser"
#emailaddress="duobuilduser@duosoftware.com"
#password="DuoS12345"

#sudo git config --global user.name $username
#sudo git config --global user.email $emailaddress

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
PERPLE='\033[1;35m'
BROWN='\033[0;35m'
CYAN='\033[0;36m'
path=$(pwd)

printf "${BLUE}Current location : $path ${NC}\n\n\n"

printf "${GREEN}#######################################################${NC}\n"
printf "\t ${BLUE}press 1 to commit files to production branch\n"
#printf "\t press 2 to update mobile shell\n"
#printf "\t press 3 to update other folder\n"
printf "\t press q to exit ${NC} \n"
printf "${GREEN}#######################################################${NC}\n"
if [ ! -d "production" ]; then
	sudo mkdir production
fi
if [ ! -d "withgitfile" ]; then
	sudo mkdir withgitfile
fi

while [ "$number" != "q" ]
do
read -p "Enter your selection  : " number
if [ "$number" == "1" ]; then
	read -p "commti to production branch  initiated ,please confirm (y/n) : " confirm 
	if [ "$confirm" == "y" ]; then
		read -p "please enter commit message : " message 
		sudo cp -r /var/www/html/* $path/withgitfile/
		cd $path
		cd withgitfile
		sudo find . -type f -name ".git*" -exec rm -f {} \;
		sudo find . -name ".git" -exec rm -r {} \;
		cd ..
		sudo cp -r withgitfile/* production/
		cd $path
		cd production
		sudo rm include/config.php
		if [ ! -d ".git" ];then
			sudo git init 
			sudo git remote add origin https://github.com/DuoSoftware/DuoworldProductionReady.git
		fi
		sudo git add *
		
		sudo git commit -m "$message" --q
		sudo git push -u origin master
	else
		printf "${RED} Selection not match try again ... ${NC}\n"
	fi
else
	printf "${RED} Selection not match try again ... ${NC}\n"
fi
done



