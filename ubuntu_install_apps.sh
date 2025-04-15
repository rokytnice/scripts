#!/bin/bash


sudo apt update
sudo apt upgrade

sudo apt install python3
sudo apt install snap
sudo apt install google-chrome-stable
sudo apt install timeshift
sudo apt install trash-cli

sudo apt install libfuse2
sudo snap install pycharm-professional --classic 
sudo snap install intellij-idea-ultimate --classic
sudo snap install intellij-professional --classic 

mkdir projects
mkdir apps


cd Downloads
echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
sudo apt-get update
sudo apt-get upgrade windsurf

