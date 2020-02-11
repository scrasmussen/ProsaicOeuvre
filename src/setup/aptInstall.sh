#!/usr/bin/env bash
set -e -x
if [ "$EUID" -ne 0 ]
then echo "Please run as root to install packages"
  exit
fi

# function to simply installation
function install(){
    sudo apt -y install $1
}


# update and upgrade then start installing packages
sudo apt update
sudo apt upgrade

# if WSL install packages, else
if grep -q Microsoft /proc/version; then
  install emacs25-nox
  install x11-xkb-utils
  gversion=8
else
  gversion=9
  install gnome-screensaver
  install texlive-latex-base
  install texinfo
  install texlive
  install texlive-extra-utils
  install texlive-latex-extra-doc
  install texlive-latex-base-doc
  install texlive-latex-recommended
  install texlive-latex-extra
  install texlive-latex-recommended-doc
  install zathura
fi


install tmux
install toilet
install build-essential
install autoconf
install cmake
install zip
install python3
install python3-pip
install gcc-$gversion
install g++-$gversion
install gfortran-$gversion

pip3 install ipython
pip3 install numpy
pip3 install pandas
pip3 install matplotlib

# probably don't need these anymore
# tlmgr init-usertree
# tlmgr update
# tlmgr install caption xstring totpages environ trimspaces ncctools
