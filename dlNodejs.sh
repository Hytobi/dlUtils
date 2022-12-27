#!/bin/bash


# @author: PLOUVIN Patrice
# @date: 27/12/2022
# @brief: Download nodejs and npm on Ubuntu

# Verifies if the exploitation system is Ubuntu
sys=`cut  -f2 <<< $(lsb_release -d)`
[ "${sys:0:6}" != "Ubuntu" ] && echo "This is not Ubuntu i can't check the following packages" && exit 1

# Do this to upgrade the system
sudo apt update && sudo apt upgrade && echo

######## Install the following packages

# Check if nodejs is installed, if not install it
nodejs -v &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "nodejs is installed" 
else
    echo "nodejs is not installed"
    read -p 'Do you want to install nodejs ? (y/n): ' nodedl
    if [ $nodedl == "y" ]
    then       
	sudo apt install nodejs
    else
        echo "you haven't download nodejs" 
    fi
fi
echo

# Check if npm is installed, if not install it
npm -v &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "npm is installed" 
else
    echo "npm is not installed"
    read -p 'Do you want to install npm ? (y/n): ' npmdl
    if [ $npmdl == "y" ]
    then       
	sudo apt install npm
    else
        echo "you haven't download npm" 
    fi
fi
echo

exit 0


