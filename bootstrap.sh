#!/bin/bash
#
# bootstrap to $ ansible-pull

set -euxo pipefail


sudo apt install git -y &&
sudo apt install ansible -y &&
ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean
