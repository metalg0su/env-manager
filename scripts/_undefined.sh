#!/bin/bash
# Pre install
echo "> Install build tools..."
apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev automake libtool lsof zlib1g-dev

sudo install fonts-nanum fonts-nanum-coding fonts-nanum-extra
sudo dpkg-reconfigure console-setup
# https://findnew.tistory.com/22

# pyenv
PYTHON_VERSION=3.7.3
curl https://pyenv.run | bash
pyenv install ${PYTHON_VERSION}
