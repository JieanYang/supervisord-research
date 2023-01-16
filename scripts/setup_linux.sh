#!/bin/bash

# echo "start"
# echo "hello yang"
# echo "end"
# echo "2022-12-30-third_script" >> "third_script_output.txt"

# Update pacakges
# sudo yum update -y

# Install git
winget install --id Git.Git -e --source winget
git version

# Fetch Go repository
git clone https://go.googlesource.com/go goroot
cd goroot
# git checkout <tag>

# Install go
cd src
./all.bat
go version

# Pull github
cd ~
DIR=~/supervisord-research
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  # echo "Installing config files in ${DIR}..."
  cd supervisord-research
  git add .
  git reset --h HEAD
  git pull
else
  ###  Control will jump here if $DIR does NOT exists ###
  # echo "Error: ${DIR} not found. Can not continue."
  # exit 1
<<<<<<< HEAD
  git clone --branch service-fix https://github.com/JieanYang/supervisord-research.git
=======
  git clone --branch dev https://github.com/JieanYang/supervisord-research.git
>>>>>>> 7590bc7 (Update scripts files)
  cd supervisord-research
fi

# Build supervisord
FILE=./supervisord
if [ -f "$FILE" ]; then
    rm $FILE
fi
go build

FILE=./go_test_api/go_test_api
if [ -f "$FILE" ]; then
    rm $FILE
fi
go build -o ./go_test_api/go_test_api.exe ./go_test_api/go_test_api.go
chmod +x ./go_test_api/go_test_api

# Copy binary app
FILE=/usr/local/bin/go_test_api
if [ -f "$FILE" ]; then
    sudo rm $FILE
fi
sudo cp ./go_test_api/go_test_api /usr/local/bin/go_test_api

sudo mkdir /supervisord

# Start service
# ./supervisord -c supervisord-linux.conf -d

# Register service as daemon
sudo ./supervisord service install -c ~/supervisord-research/supervisord-linux.conf
sudo ./supervisord service start