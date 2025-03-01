#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
then echo "Please run as root to install packages"
  exit
fi

# function to simply installation
function install(){
    sudo apt -y install $1
}


echo "--------------------------------------------"
echo "-        Installing Linux Packages         -"
echo "--------------------------------------------"

set -e -x
# update and upgrade then start installing packages
sudo apt update
sudo apt upgrade

# if WSL install packages, else
if grep -q Microsoft /proc/version; then
  install emacs25-nox
  install x11-xkb-utils
  gversion=8
else
  gversion=10
  echo "Version ${gversion} of GNU will be installed. Is this ok?"
  read ok
  if [[ ${ok} != 'yes' || ${ok} != 'y' ]]; then
      echo "Not proceeding, edit file"
      exit 1
  fi

  install gnome-screensaver
  install texlive-latex-base
  install texinfo
  install texlive
  install texlive-extra-utils
  install texlive-font-utils
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
install lmod
install graphviz
install tree

{ set +x; } 2> /dev/null
echo "--------------------------------------------"
echo "-        Installing Python Packages        -"
echo "--------------------------------------------"
set -e -x
pip3 install ipython
pip3 install numpy
pip3 install scipy
pip3 install pandas
pip3 install matplotlib
pip3 install pip-review
pip3 install beautifulsoup4
pip3 install tabulate
pip3 install jupyterlab


# probably don't need these anymore
# tlmgr init-usertree
# tlmgr update
# tlmgr install caption xstring totpages environ trimspaces ncctools
