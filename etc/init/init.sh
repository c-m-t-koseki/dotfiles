#!/bin/bash

DIR=$(pwd)
CORE=$(grep cpu.cores /proc/cpuinfo | sort -u | cut -f 3 -d ' ')

mkdir -p $HOME/opt/bin
PATH=$HOME/opt/bin:$PATH

cd $DIR
if [[ ! -f $HOME/opt/bin/ghq ]]; then
    wget https://github.com/motemen/ghq/releases/download/v0.12.6/ghq_linux_amd64.zip
    unzip ghq_linux_amd64.zip; rm ghq_linux_amd64.zip 
    mv ghq_linux_amd64/ghq ~/opt/bin/
    rm -rf ghq_linux_amd64
fi

cd $DIR
if [[ ! -f $HOME/opt/bin/vim ]]; then
    ghq get vim/vim
    cd $HOME/src/github.com/vim/vim/
    ./configure --prefix $HOME/opt --enable-pythoninterp --enable-python3interp --enable-fail-if-missing
    make install -j$CORE
fi

cd $DIR
if [[ ! -f $HOME/opt/bin/ts ]]; then
    wget http://vicerveza.homeunix.net/~viric/soft/ts/ts-1.0.tar.gz
    tar xzf ts-1.0.tar.gz; rm -rf ts-1.0.tar.gz
    cd ts-1.0
    PREFIX=$HOME/opt make -j$CORE install
    cd ..
    rm -rf ts-1.0/
fi

cd $DIR
if [[ ! -f $HOME/opt/bin/htop ]]; then
    # need libncurses
    # wget https://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
    # tar xzf htop-2.2.0.tar.gz; rm htop-2.2.0.tar.gz
    # cd htop-2.2.0/
    # ./configure --prefix $HOME/opt
    # make install -j$CORE
fi
