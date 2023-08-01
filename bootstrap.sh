#!/bin/bash

usermod -aG sudo $USER &&
sudo apt install git -y &&
sudo apt install ansible -y &&
ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean
