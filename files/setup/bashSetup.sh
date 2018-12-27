#!/usr/bin/env bash
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
     exit
fi
N=$'\n'

# set ding to visual
ding="set bell-style visible"
if ! grep -q "^$ding"  "/etc/inputrc"; then
    echo "${N}${ding}" >> /etc/inputrc
fi

echo "Fin"
