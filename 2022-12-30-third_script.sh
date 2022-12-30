#!/bin/bash

# echo "start"
# echo "hello yang"
# echo "end"
# echo "2022-12-30-third_script" >> "third_script_output.txt"

# Update pacakges
sudo yum update -y

# Install git
sudo yum install git -y

# Install go
sudo yum install golang -y

# Pull github
cd ~
git clone https://github.com/JieanYang/supervisord-research.git
cd supervisord-research

# Build supervisord
go build

# Start service
./supervisord -c supervisor-linux.conf