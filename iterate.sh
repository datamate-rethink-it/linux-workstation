#!/bin/bash
#
# iterate on live desktop with git push and ansible-pull

set -euxo pipefail

git add .
git commit -m "iterate" --allow-empty
git push 

ansible-pull -U https://github.com/anconrad/linux-workstation -e "user=$USER"
