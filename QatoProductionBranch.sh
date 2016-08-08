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
printf "\t press 2 to update specific component \n"
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
		printf "${RED} Selection not canceled   ... ${NC}\n"
	fi
elif [ "$number" == "2" ]; then
	read -p "commti to production branch  initiated ,please confirm (y/n) : " confirm 
	if [ "$confirm" == "y" ]; then
		printf "${BLUE}Folder update selected  ${NC}\n"
		printf "${BLUE}please provide folder path relative to the Duoworld root folder${NC}\n"
		printf "${BLUE}eg:- actual folder path Duoworldsite/apis/template${NC}\n"
		printf "${BLUE}you have to enter \"/apis/template\"${NC}\n"
		read -p "please enter directory location  : " folder

		if [ -d "/var/www/html$folder" ]; then
			echo "/var/www/html$folder"
			read -p "please enter commit message : " message 
			sudo cp -r /var/www/html$folder/* $path/withgitfile$folder/
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
			echo "false"
			printf "${RED} folder not found ... ${NC}\n"
		fi
	else
		printf "${RED} Selection not canceled   ... ${NC}\n"
	fi

elif [ "$number" == "q" ]; then
	printf "${GREEN}#######################################################${NC}\n"
	printf "${GREEN}#                                                     #${NC}\n"
	printf "${GREEN}#\t\tg${RED}o${BLUE}o${YELLOW}d ${PERPLE}b${BROWN}y${CYAN}e\t\t\t${GREEN}#${NC} \n"
	printf "${GREEN}#                                                     #${NC}\n"
	printf "${GREEN}#######################################################${NC}\n"
else
	printf "${RED}wrong selection try again${NC}\n"
fi
done



