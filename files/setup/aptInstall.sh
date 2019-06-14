#!/usr/bin/env bash
set -e -x
if [ "$EUID" -ne 0 ]
then echo "Please run as root to install packages"
     exit
fi

sudo apt update
sudo apt install emacs25-nox
sudo apt install tmux
sudo apt install x11-xkb-utils
sudo apt install build-essential
sudo apt install autoconf
sudo apt install cmake
