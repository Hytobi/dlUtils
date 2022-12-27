#!/bin/bash

# @author: PLOUVIN Patrice
# @date: 24/12/2022
# @brief: Download the necessary packages to compile the program
# @version: 1.0

# Verifies if the exploitation system is Ubuntu
sys=`cut  -f2 <<< $(lsb_release -d)`
[ "${sys:0:6}" != "Ubuntu" ] && echo "This is not Ubuntu i can't check the following packages" && exit 1

# Do this to upgrade the system
sudo apt update && sudo apt upgrade && echo

######## Install the following packages

# Install python3-pip
sudo apt install python3-pip

# Install qrcode extension
pip install pyqrcode  

# Install png extension
pip install pypng  