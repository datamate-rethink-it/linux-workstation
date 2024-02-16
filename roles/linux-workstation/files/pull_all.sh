#!/bin/bash

for dir in ./*/
do
  if [ -d "$dir/.git" ]; then
    cd "$dir"
    branch=$(git rev-parse --abbrev-ref HEAD)
    echo "Pulling in $dir on branch $branch"
    git pull
    cd ..
  fi
done
