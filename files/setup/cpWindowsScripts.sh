#!/bin/bash

# set -e -x

function compare {

    if [ ! -f $1 ]; then
	cp /mnt/c/Users/scras/Documents/src/powershell/$1 .
    elif [[ $(cmp $1 /mnt/c/Users/scras/Documents/src/powershell/$1) ]]; then
	cp /mnt/c/Users/scras/Documents/src/powershell/$1 .
    fi
}

files=(addCaps.reg installWindowsApps.ps1 installWSL2.ps1 stopStartupApps.ps1)

for f in ${files[@]}; do
    compare $f
done
