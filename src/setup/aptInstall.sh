#!/usr/bin/env bash
set -e -x
if [ "$EUID" -ne 0 ]
then echo "Please run as root to install packages"
  exit
fi

sudo apt update
sudo apt upgrade

if grep -q Microsoft /proc/version; then
  sudo apt -y install emacs25-nox
  sudo apt -y install x11-xkb-utils
  gversion=8
else
  gversion=9
  sudo apt -y install gnome-screensaver
fi


sudo apt -y install tmux
sudo apt -y install texinfo
sudo apt -y install texlive-extra-utils
sudo apt -y install toilet
sudo apt -y install build-essential
sudo apt -y install autoconf
sudo apt -y install cmake
sudo apt -y install zip
sudo apt -y install python3
sudo apt -y install python3-pip
sudo apt -y install gcc-$gversion
sudo apt -y install g++-$gversion
sudo apt -y install gfortran-$gversion
pip3 install ipython
pip3 install numpy
pip3 install pandas
