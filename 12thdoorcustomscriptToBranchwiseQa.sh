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
printf "\t ${BLUE}press 1 to update all from 12thdoorSiteV1 repo\n"
printf "\t press 2 to update any other folder \n"
# printf "\t press 3 to update other folder\n"
# printf "\t press 4 to update dwbording \n"
printf "\t press q to exit ${NC} \n"
printf "${GREEN}#######################################################${NC}\n"


while [ "$number" != "q" ]
do
read -p "Enter your selection  : " number

if [ "$number" == "1" ]; then
	read -p "all folder update  selected ,please confirm (y/n) : " confirm 
	# printf "${RED}backup process running .please wait ...${NC} \n "
	# cd backup
	# tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
	# sudo tar -cf $tarfilename.tar.gz /var/www/html
	cd $path
	# printf "${GREEN}backup process completed ${NC} \n "
	read -p "please type branch name : " branch 

	if [ "$confirm" == "y" ]; then
		printf "${GREEN}confirmed. update process running ...${NC} \n "
		if [ -d "12thdoorSiteV1" ]; then
			cd $path
			cd 12thdoorSiteV1
			git checkout $branch
			sudo git pull
			printf "${GREEN}folder found pull request${NC} \n"
		else
			printf "${RED}folder not found cloning${NC} \n "
			cd $path
			sudo git clone -b $branch https://$username:$password@github.com/DuoSoftware/12thdoorSiteV1	
		fi
		cd $path
		sudo cp -r  12thdoorSiteV1/* /var/www/html/
	elif [ "$confirm" == "n" ]; then
		printf "${GREEN}selection canceled${NC} \n"
	else
		printf "${RED}wrong selection try again ${NC}\n"
	fi
elif [ "$number" == "2" ]; then
	read -p "please type branch name : " branch 
	printf "${BLUE}Folder update selected  ${NC}\n"
	printf "${BLUE}please provide folder path relative to the 12thdoorSiteV1 root folder${NC}\n"
	printf "${BLUE}eg:- actual folder path 12thdoorSiteV1/apis/template${NC}\n"
	printf "${BLUE}you have to enter \"/apis/template\"${NC}\n"
	# printf "${BLUE}enter * for update entire 12thdoorSiteV1${NC}\n"
	printf "${BLUE}press \"q\"  cancel ${NC}\n"
	read -p "enter folder location " location
	if [ "$location" == "q" ]; then
		printf "${RED}selection canceled ${NC}\n"
	else
		# read -p "please type branch name : " branch 
		cd $path
		if [ ! -d "backup" ]; then
			sudo mkdir backup
		fi
		if [ ! -d "temp12thdoorSiteV1" ] ;then
				sudo mkdir temp12thdoorSiteV1
		fi
		cd temp12thdoorSiteV1
		sudo git clone -b $branch https://$username:$password@github.com/DuoSoftware/12thdoorSiteV1
		# sudo git pull
		cd $path
		if [ -d "temp12thdoorSiteV1/12thdoorSiteV1$location" ]; then
				cd $path
				printf "${RED}backup process running .please wait ...${NC} \n "
				# tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
				# cd backup
				# sudo tar -cf $tarfilename.tar.gz  /var/www/html
				# cd $path
				# printf "${GREEN}backup process completed ${NC} \n "
				sudo cp -r temp12thdoorSiteV1/12thdoorSiteV1$location/* /var/www/html$location
				printf "${GREEN}$location updated${NC}\n"
				cd $path				
		else
			printf "${RED}Folder not found please check again ${NC}\n"
		fi	
		cd $path
		sudo rm -r temp12thdoorSiteV1
		
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
