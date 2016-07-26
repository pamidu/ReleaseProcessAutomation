#!/bin/bash
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"

sudo git config --global user.name $username
sudo git config --global user.email $emailaddress

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
PERPLE='\033[1;35m'
BROWN='\033[0;35m'
CYAN='\033[0;36m'
path=$(pwd)

if [ ! -d "backup" ]; then
	sudo mkdir backup
fi


printf "${BLUE}Current location : $path ${NC}\n\n\n"

printf "${GREEN}#######################################################${NC}\n"
printf "\t ${BLUE}press 1 to update  shell\n"
printf "\t press 2 to update mobile shell\n"
printf "\t press 3 to update other folder\n"
printf "\t press q to exit ${NC} \n"
printf "${GREEN}#######################################################${NC}\n"


while [ "$number" != "q" ]
do
read -p "Enter your selection  : " number

if [ "$number" == "1" ]; then
	read -p "shell selected ,please confirm (y/n) : " confirm 
	printf "${RED}backup process running .please wait ...${NC} \n "
	cd backup
	tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
	sudo tar -cf $tarfilename.tar.gz /var/www/html
	cd $path
	printf "${GREEN}backup process completed ${NC} \n "
	if [ "$confirm" == "y" ]; then
		printf "${GREEN}confirmed. update process running ...${NC} \n "
		if [ -d "DW-alpha-shell" ]; then
			cd $path
			cd DW-alpha-shell
			sudo git pull
			printf "${GREEN}folder found pull request${NC} \n"
		else
			printf "${RED}folder not found cloning${NC} \n "
			cd $path
			sudo git clone https://$username:$password@github.com/DuoSoftware/DW-alpha-shell		
		fi
		cd $path
		sudo cp -r  DW-alpha-shell/dist/* /var/www/html/shell
	elif [ "$confirm" == "n" ]; then
		printf "${GREEN}selection canceled${NC} \n"
	else
		printf "${RED}wrong selection try again ${NC}\n"
	fi
elif [ "$number" == "2" ]; then
	read -p "mobile shell selected ,please confirm (y/n) :  " confirm 
	if [ "$confirm" == "y" ]; then
		cd $path
		if [ ! -d "backup" ]; then
			sudo mkdir backup
		fi
		printf "${RED}backup process running .please wait ...${NC} \n "
		cd backup
		tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
		sudo tar -cf $tarfilename.tar.gz  /var/www/html
		cd $path
		printf "${GREEN}backup process completed ${NC} \n "
		printf "${GREEN}confirmed. update process running ... ${NC}\n"
		if [ ! -d "mobile" ]; then
			sudo mkdir mobile 

		fi
		cd mobile
		if [ -d "DW-alpha-shell" ]; then
			cd DW-alpha-shell
			sudo git pull
			printf "${GREEN}folder found pull request ${NC}\n"
		else
			printf "${RED}folder not found cloning${NC} \n "
			sudo git clone https://$username:$password@github.com/DuoSoftware/DW-alpha-shell
			cd DW-alpha-shell
			sudo git pull 			
		fi
		cd $path
		cd mobile
		sudo cp -r  DW-alpha-shell/dist/* /var/www/html/mobile_shell
	elif [ "$confirm" == "n" ]; then
		printf "${GREEN}selection canceled${NC}\n"
	else
		printf "${RED}wrong selection try again ${NC}\n"
	fi

elif [ "$number" == "3" ]; then
	printf "${BLUE}Folder update selected  ${NC}\n"
	printf "${BLUE}please provide folder path relative to the Duoworld root folder${NC}\n"
	printf "${BLUE}eg:- actual folder path Duoworldsite/apis/template${NC}\n"
	printf "${BLUE}you have to enter \"/apis/template\"${NC}\n"
	printf "${BLUE}enter * for update entire Duoworldsite${NC}\n"
	printf "${BLUE}press \"q\"  cancel ${NC}\n"
	read -p "enter folder location " location
	if [ "$location" == "*" ]; then
		cd $path
		if [ ! -d "backup" ]; then
			sudo mkdir backup
		fi
		printf "${RED}backup process running .please wait ...${NC} \n "
		cd backup
		tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
		sudo tar -cf $tarfilename.tar.gz  /var/www/html
		cd $path
		printf "${GREEN}backup process completed ${NC} \n "
		if [ -d "Duoworldsite" ]; then
			cd Duoworldsite
			sudo git pull 
		else 
			sudo git clone https://$username:$password@github.com/DuoSoftware/Duoworldsite
		fi
		cd $path
		sudo cp -r Duoworldsite/* /var/www/html
	elif [ "$location" == "q" ]; then
		printf "${RED}selection canceled ${NC}\n"
	else
		
		cd $path
		if [ ! -d "backup" ]; then
			sudo mkdir backup
		fi
		if [ ! -d "tempDuoworld" ] ;then
				sudo mkdir tempDuoworld
		fi
		cd tempDuoworld
		sudo git clone https://$username:$password@github.com/DuoSoftware/Duoworldsite
		sudo git pull
		cd $path
		if [ -d "tempDuoworld/Duoworldsite$location" ]; then
				cd $path
				printf "${RED}backup process running .please wait ...${NC} \n "
				tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
				cd backup
				sudo tar -cf $tarfilename.tar.gz  /var/www/html
				cd $path
				printf "${GREEN}backup process completed ${NC} \n "
				sudo cp -r tempDuoworld/Duoworldsite$location /var/www/html$location
				printf "${GREEN}$location updated${NC}\n"
				cd $path				
		else
			printf "${RED}Folder not found please check again ${NC}\n"
		fi	
		cd $path
		sudo rm -r tempDuoworld
		
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
