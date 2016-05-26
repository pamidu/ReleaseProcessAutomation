#!/bin/bash
BuildOutPath="$PWD"
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"

sudo git config --global user.name $username
sudo git config --global user.email $emailaddress
#sudo su
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
PERPLE='\033[1;35m'
BROWN='\033[0;35m'
CYAN='\033[0;36m'
path= pwd
tarfilename="$(date +'%d-%m-%Y-%H_%M_%S')"
if [ ! -d "backup" ];then
	sudo mkdir backup
fi


printf "${BLUE}Current location : $path ${NC}\n"

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
	sudo tar -cf backup/$tarfilename.tar.gz /var/www/html
	printf "${GREEN}backup process completed ${NC} \n "
	if [ "$confirm" == "y" ]; then
		printf "${GREEN}confirmed. update process running ...${NC} \n "
		if [ -d "DW-alpha-shell" ]; then
			#echo 1
			#pwd
			cd $path
			cd DW-alpha-shell
			sudo git pull
			printf "${GREEN}folder found pull request${NC} \n"
		else
			#echo 2
			printf "${RED}folder not found cloning${NC} \n "
			sudo git clone https://$username:$password@github.com/DuoSoftware/DW-alpha-shell.git
			sudo git pull 
			#pwd
			
		fi
		#echo DW-alpha-shell/
		#echo 111
		cd $path
		sudo cp -r DW-alpha-shell/* /var/www/htmlpamidu/shell/
	elif [ "$confirm" == "n" ]; then
		printf "${GREEN}selection canceled${NC} \n"
	else
		printf "${RED}wrong selection try again ${NC}\n"
	fi

elif [ "$number" == "2" ]; then
	read -p "mobile shell selected ,please confirm (y/n) :  " confirm 
	if [ "$confirm" == "y" ]; then
		cd $path
		printf "${RED}backup process running .please wait ...${NC} \n "
		sudo tar -cf backup/$tarfilename.tar.gz /var/www/html
		printf "${GREEN}backup process completed ${NC} \n "
		printf "${GREEN}confirmed. update process running ... ${NC}\n"
		if [ ! -d "mobile" ]; then
			sudo mkdir mobile 

		fi
		cd mobile
		if [ -d "DW-alpha-shell" ]; then
			#echo 1
			#pwd
			#cd $path
			cd DW-alpha-shell
			sudo git checkout mobile
			sudo git pull
			printf "${GREEN}folder found pull request ${NC}\n"
		else
			#echo 2
			printf "${RED}folder not found cloning${NC} \n "
			sudo git clone https://$username:$password@github.com/DuoSoftware/DW-alpha-shell.git
			cd DW-alpha-shell
			sudo git checkout mobile
			sudo git pull 
			#pwd
			
		fi
		cd $path
		#pwd
		cd mobile
		#pwd
		sudo cp -r DW-alpha-shell/* /var/www/htmlpamidu/mobile_shell
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
	read -p "enter folder location " location
	if [ "$confirm" == "y" ]; then
		cd $path
		printf "${RED}backup process running .please wait ...${NC} \n "
		sudo tar -cf backup/$tarfilename.tar.gz /var/www/html
		printf "${GREEN}backup process completed ${NC} \n "
		if [ -d "Duoworldsite" ]; then
			cd $path
			if [ ! -d "tempDuoworld" ]; then
				printf "${GREEN}tempdoworld creating...${NC}\n" 
				sudo mkdir tempDuoworld
			fi
			cd tempDuoworld
			sudo git clone https://$username:$password@github.com/DuoSoftware/Duoworldsite
			#pwd
			#printf "tempDuoworld/Duoworldsite$location"
			if [ -d "Duoworldsite$location" ]; then
				cd $path
				sudo cp -r tempDuoworld/Duoworldsite/$location Duoworldsite$location
				sudo cp -r Duoworldsite/* /var/www/htmlpamidu/
				printf "${GREEN}$location updated${NC}\n"
				cd $path
				sudo rm -r tempDuoworld
				#cd Duoworldsite$location
				#sudo git pull 
				#pwd
			else
				printf "${RED}Folder not found please check again ${NC}\n"
			fi
		else
			cd $path
			sudo git clone https://$username:$password@github.com/DuoSoftware/Duoworldsite
			if [ -d "Duoworldsite$location" ]; then
				sudo cp -r Duoworldsite/* /var/www/htmlpamidu/
			#cd Duoworldsite$location
			else
				printf "${RED}Folder not found please check again ${NC}\n"
			fi
		fi
	elif [ "$confirm" == "n" ]; then
		printf "${GREEN}selection canceled${NC}\n"
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
