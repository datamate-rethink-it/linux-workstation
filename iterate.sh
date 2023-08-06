#!/bin/bash
#
# iterate on live desktop with git push and ansible-pull

set -euxo pipefail

cd "$(dirname "$0")"

git add .
git commit -m "iterate" --allow-empty
git push

ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean --ask-become-pass
