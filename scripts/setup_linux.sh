Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Get-ExecutionPolicy -List

$script = New-Object Net.WebClient
$script | Get-Member
$script.DownloadString("https://chocolatey.org/install.ps1")
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey

choco install -y golang git.install
# $env:Path += 'C:\Program Files\Git\bin\git.exe;'
# $env:Path += 'C:\Program Files\Go\bin\go.exe;'

New-Alias -Name git -Value 'C:\Program Files\Git\bin\git.exe'
New-Alias -Name go -Value 'C:\Program Files\Go\bin\go.exe'

git clone --branch dev https://github.com/JieanYang/supervisord-research.git

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
  git clone --branch service-fix https://github.com/JieanYang/supervisord-research.git
  cd supervisord-research
fi

# Build supervisord
FILE=./supervisord
if [ -f "$FILE" ]; then
    rm $FILE
fi
go build
go build -o ./go_test_api/go_test_api.exe ./go_test_api/go_test_api.go

New-NetFirewallRule -DisplayName 'Go-application' -Profile @('Domain', 'Public','Private') -Direction Inbound -Action Allow -Protocol TCP -LocalPort @('9001')

sudo mkdir /supervisord

# Start service
# ./supervisord -c supervisord-linux.conf -d

# Register service as daemon
sudo ./supervisord service install -c ~/supervisord-research/supervisord-linux.conf
sudo ./supervisord service start