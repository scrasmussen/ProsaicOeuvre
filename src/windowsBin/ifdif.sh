# -*-sh-*-
#!/bin/bash

function compare {

    if [ ! -f $1 ]; then
	cp /mnt/c/Users/scras/Documents/local/bin/$1 .
	echo "copied $1"
    elif [[ $(cmp $1 /mnt/c/Users/scras/Documents/local/bin/$1) ]]; then
	cp /mnt/c/Users/scras/Documents/src/powershell/$1 .
	echo "copied $1"
    fi
}

files=(lock.ps1 ssp.ps1 sst.ps1)

for f in ${files[@]}; do
    compare $f
done
