#!

# CHECK OS - WILL BE FIXED
if [[ -z $1 ]]; then
    echo "NEED OS"
    exit 1
fi
OS=$1

##---- loopchain dependencies
# automake 
# pkg-config 
# libtool 
# leveldb 
# rabbitmq 
# openssl

#####----- Centos Installation 
## Setting build environment
sudo yum update
sudo yum install git zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel gcc gcc-c++ automake libtool lsof -y

## RabbitMQ Installation
# Install erlang
sudo yum install wget epel-release -y
wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
sudo yum install erlang -y

# Install RabbitMQ
sudo rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
wget https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.7/rabbitmq-server-3.7.7-1.el7.noarch.rpm
sudo yum install rabbitmq-server-3.7.7-1.el7.noarch.rpm -y


#####----- Ubuntu Installation
## Setting build environment
# install libraries
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev automake libtool

# ubuntu 18.04 need install secp256k1 library - TODO: HARMLESS TO NOT LATEST UBUNTU?
sudo apt install -y libsecp256k1-dev

## RabbitMQ Installation
# Install RabbitMQ
sudo apt install rabbitmq-server -y


########## ###########
# Run RabbitMQ (Ubuntu)
sudo service rabbitmq-server start

# Run RabbitMQ (CentOS)
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
