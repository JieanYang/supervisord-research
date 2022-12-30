#!/bin/bash

# echo "start"
# echo "hello yang"
# echo "end"
# echo "2022-12-30-third_script" >> "third_script_output.txt"

# Update pacakges
sudo yum update -y

# Install git
sudo yum install git -y
git version

# Install go
sudo yum install golang -y
go version

# Pull github
cd ~
DIR="~/supervisord-research"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  # echo "Installing config files in ${DIR}..."
  cd supervisord-research
  git pull
else
  ###  Control will jump here if $DIR does NOT exists ###
  # echo "Error: ${DIR} not found. Can not continue."
  # exit 1
  git clone https://github.com/JieanYang/supervisord-research.git
  cd supervisord-research
fi

# Build supervisord
go build

# Start service
./supervisord -c supervisor-linux.conf