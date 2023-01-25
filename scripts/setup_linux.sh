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
cd /
DIR_SUPERVISORD_RESEARCH=/supervisord-research
if [ -d "$DIR_SUPERVISORD_RESEARCH" ]; then
  ### Take action if $DIR_SUPERVISORD_RESEARCH exists ###
  # echo "Installing config files in ${DIR_SUPERVISORD_RESEARCH}..."
  cd $DIR_SUPERVISORD_RESEARCH
  git add .
  git reset --h HEAD
  git pull
else
  ###  Control will jump here if $DIR_SUPERVISORD_RESEARCH does NOT exists ###
  # echo "Error: ${DIR_SUPERVISORD_RESEARCH} not found. Can not continue."
  # exit 1
  echo "Clone github repository-start"
  sudo git clone --branch dev https://github.com/JieanYang/supervisord-research.git $DIR_SUPERVISORD_RESEARCH
  cd $DIR_SUPERVISORD_RESEARCH
  echo "Clone github repository-end"
fi

# Build supervisord
FILE="${DIR_SUPERVISORD_RESEARCH}/supervisord"
if [ -f "$FILE" ]; then
    rm $FILE
fi
sudo go build

FILE="${DIR_SUPERVISORD_RESEARCH}/go_test_api/go_test_api"
if [ -f "$FILE" ]; then
    rm $FILE
fi
sudo go build -o "${DIR_SUPERVISORD_RESEARCH}/go_test_api/go_test_api" "${DIR_SUPERVISORD_RESEARCH}/go_test_api/go_test_api.go"
sudo chmod +x "${DIR_SUPERVISORD_RESEARCH}/go_test_api/go_test_api"

# Copy binary app
FILE=/usr/local/bin/go_test_api
if [ -f "$FILE" ]; then
    sudo rm $FILE
fi
sudo cp "${DIR_SUPERVISORD_RESEARCH}/go_test_api/go_test_api" /usr/local/bin/go_test_api

DIR_SUPERVISORD_LOG=/supervisord
sudo mkdir $DIR_SUPERVISORD_LOG

# Start service
# ./supervisord -c supervisord-linux.conf -d

# Register service as daemon
sudo "${DIR_SUPERVISORD_RESEARCH}/supervisord" service install -c "${DIR_SUPERVISORD_RESEARCH}/supervisord-linux.conf"
sudo "${DIR_SUPERVISORD_RESEARCH}/supervisord" service start