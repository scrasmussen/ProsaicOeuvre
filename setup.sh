#!/bin/bash
sudo su
apt emacs25
alias emacs='emacs -nw'

# caps is ctrl
setxkbmap -option ctrl:nocaps
# need to add this to .bashrc
# echo "setxkbmap -option ctrl:nocaps" >> ~/.bashrc
