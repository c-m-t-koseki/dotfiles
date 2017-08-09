#!/bin/bash

sudo apt install git curl libjpeg-dev

# caps2ctrl
sed -i s/XKBOPTIONS=\"\"/XKBOPTIONS=\"ctrl:nocaps\"/ asdf /etc/default/keyboard

# ghq
sudo apt install golang
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
go get github.com/motemen/ghq

# xcape
sudo apt install libx11-dev libxtst-dev libxi-dev
ghq look xcape
make
sudo make install

# tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

