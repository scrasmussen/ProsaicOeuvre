#!/usr/bin/env bash
set -e -x
if [ "$EUID" -ne 0 ]
then echo "Please run as root to install packages"
     exit
fi

sudo apt update
sudo apt upgrade
sudo apt install emacs25-nox
sudo apt install tmux
sudo apt install x11-xkb-utils
sudo apt install build-essential
sudo apt install autoconf
sudo apt install cmake
sudo apt install python3
sudo apt install pip3

pip3 install ipython
pip3 install numpy
pip3 install pandas
