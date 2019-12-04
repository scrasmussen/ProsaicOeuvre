#!/usr/bin/env bash
set -e -x
if [ "$EUID" -ne 0 ]
then echo "Please run as root to install packages"
     exit
fi

sudo apt update
sudo apt upgrade
sudo apt -y install emacs25-nox
sudo apt -y install tmux
sudo apt -y install x11-xkb-utils
sudo apt -y install build-essential
sudo apt -y install autoconf
sudo apt -y install cmake
sudo apt -y install python3
sudo apt -y install python3-pip
sudo apt -y install gcc-8
sudo apt -y install g++-8
sudo apt -y install gfortran-8
pip3 install ipython
pip3 install numpy
pip3 install pandas
