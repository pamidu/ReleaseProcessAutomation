#!/bin/bash

BuildOutPath="$PWD"
username="duobuilduser"
emailaddress="duobuilduser@duosoftware.com"
password="DuoS12345"
sudo rm -r 12thDoorAppsV2
git config --global user.name $username
git config --global user.email $emailaddress

number=0
git clone https://$username:$password@github.com/DuoSoftware/12thDoorAppsV2
cd 12thDoorAppsV2
git pull




echo -e  "\n\n*****************************************************\n"
echo "press 0 to install 360  App"
echo "press 1 to install CONTACTS  App"
echo "press 2 to install CREDIT_NOTES App"
echo "press 3 to install ESTIMATES App" 
echo "press 4 to install EXPENSE App"
echo "press 5 to install INVENTORY App"  
echo "press 6 to install INVOICES App"  
echo "press 7 to install PAYMENTS App"  
echo "press 8 to install PRODUCTS App"  
echo "press 9 to install PROJECTS App"  
echo "press 10 to install SETTINGS App"
echo "press 11 to install FILE_MANAGER App"
echo "press 12 to install 12thDoorPaymentPortal Apps"
echo "press 13 to install All Apps"

echo "press q fore quite "



echo -e  "\n*****************************************************\n\n"

while [ $number != "q" ]
do
read -p "Enter your selection  : " number

echo -e "\n\n*****************************************************\n\n"

if [ "$number" == "0" ]; then
	read -p "360 app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/360_VIEW /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "1" ]; then
	read -p "CONTACTS app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/CONTACTS /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi

elif [ "$number" == "2" ]; then
	read -p "CREDIT_NOTES app selected ,please confirm (y/n) " confirm
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/CREDIT_NOTES /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi 
elif [ "$number" == "3" ]; then
	read -p "ESTIMATES app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/ESTIMATES /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "4" ]; then
	read -p "EXPENSE app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/EXPENSE /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "5" ]; then
	read -p "INVENTORY app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/INVENTORY /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "6" ]; then
	read -p "INVOICES app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/INVOICES /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "7" ]; then
	read -p "PAYMENTS app selected ,please confirm (y/n) " confirm
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/PAYMENTS /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi 
elif [ "$number" == "8" ]; then
	read -p "PRODUCTS app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/PRODUCTS /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "9" ]; then
	read -p "PROJECTS app selected ,please confirm (y/n) " confirm
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/PROJECTS /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi 
elif [ "$number" == "10" ]; then
	read -p "SETTINGS app selected ,please confirm (y/n) " confirm 
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/SETTINGS /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi
elif [ "$number" == "11" ]; then
	read -p "FILE_MANAGER app selected ,please confirm (y/n) " confirm
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/FILE_MANAGER /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi 
elif [ "$number" == "12" ]; then
	read -p "12thDoorPaymentPortal apps selected ,please confirm (y/n) " confirm
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/12thDoorPaymentPortal /var/www/html/
		echo "update process completed. press 'q' for quite ..."
	fi 
elif [ "$number" == "13" ]; then
	read -p "12thDoorPaymentPortal apps selected ,please confirm (y/n) " confirm
	if [ "$confirm" == "y" ]; then
		echo "confirmed. update process running ... "
		sudo cp -r  /var/www/html/update/12thDoorAppsV2/* /var/www/html/12thDoorApps/
		echo "update process completed. press 'q' for quite ..."
	fi 
fi

echo -e  "\n\n*****************************************************\n"
done


echo -e  "\n\n*****************Good Bye Pimpio **********************\n"