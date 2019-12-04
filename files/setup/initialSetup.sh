#!/bin/bash

# initial setup
sudo apt update
sudo apt upgrade
sudo apt install emacs25-nox

# ssh setup
ssh-keygen -t rsa -b 4096 -C "s.c.rasmussen@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

@echo "Copy the following:"
@cat ~/.ssh/id_rsa

@echo
@echo "Enter the following:"
echo "git clone git@github.com:scrasmussen/ProsaicOeuvre.git"



