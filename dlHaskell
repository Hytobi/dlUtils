#!/bin/bash


# @author: PLOUVIN Patrice
# @date: 27/12/2022
# @brief: Download Haskell on Ubuntu

# Verifies if the exploitation system is Ubuntu
sys=`cut  -f2 <<< $(lsb_release -d)`
[ "${sys:0:6}" != "Ubuntu" ] && echo "This is not Ubuntu i can't check the following packages" && exit 1

# Do this to upgrade the system
sudo apt update && sudo apt upgrade && echo

######## Install the following packages

# Check if Haskell is installed, if not install it
haskell-compiler --version &> /dev/null 
if [ `cut -d' ' -f1 <<< $?` -eq 0 ] 
then
    echo "haskell is installed" 
else
    echo "haskell is not installed"
    read -p 'Do you want to install haskell ? (y/n): ' haskelldl
    if [ $haskelldl == "y" ]
    then       
	sudo apt-get install haskell-platform -y
    else
        echo "you haven't download haskell" 
    fi
fi
echo