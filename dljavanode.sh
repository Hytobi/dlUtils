#!/bin/bash


# @author: PLOUVIN Patrice
# @date: 27/12/2022
# @brief: Download nodejs, npm, java on Ubuntu

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
	sudo apt install nodejs
fi
echo

# Check if npm is installed, if not install it
npm -v &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "npm is installed" 
else      
	sudo apt install npm
fi
echo

# Check if java is installed, if not install it
java -v &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "java is installed" 
    java -v
else
    read -p "version you want to install ? (def/8/11/17/18/19):" choice
    case $choice in
        8)  sudo apt install openjdk-8-jre-headless;;
        11) sudo apt install openjdk-11-jre-headless;;
        17) sudo apt install openjdk-17-jre-headless;;
        18) sudo apt install openjdk-18-jre-headless;;
        19) sudo apt install openjdk-19-jre-headless;;
        *)  sudo apt install default-jre;;
    esac
fi
echo

# Check if git is installed, if not install it
git version &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "git is installed" 
else      
	sudo apt-get install git-all
fi
echo

# Check if jhipster is installed, if not install it
npm -v &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "jhipster is installed" 
else      
	npm install -g generator-jhipster
fi
echo

exit 0