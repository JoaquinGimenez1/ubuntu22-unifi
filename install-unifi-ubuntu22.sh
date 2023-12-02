#!/bin/bash
################
# UniFi install on Ubuntu 22.04
# References: 
#  - https://help.ui.com/hc/en-us/articles/220066768-Updating-and-Installing-Self-Hosted-UniFi-Network-Servers-Linux-
#  - https://www.mongodb.com/docs/v3.6/tutorial/install-mongodb-on-ubuntu/
#  - https://askubuntu.com/questions/1403619/mongodb-install-fails-on-ubuntu-22-04-depends-on-libssl1-1-but-it-is-not-insta
################

sudo apt update
sudo apt upgrade -y
sudo apt update
sudo apt install -y ca-certificates apt-transport-https
# Add unifi repo 
echo 'deb [ arch=amd64,arm64 ] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
# Add unifi gpg key
sudo wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
# Add mongodb repo and GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
echo "deb https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
# Add focal repo to install `libssl1.1`    
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt update
sudo apt install -y libssl1.1
# Install mongo
sudo apt install -y mongodb-org
# Remove deprecated lib
sudo rm /etc/apt/sources.list.d/focal-security.list
# Update and install unifi
sudo apt update
sudo apt install -y unifi
# Enable and start unifi service
service unifi enable
service unifi start
