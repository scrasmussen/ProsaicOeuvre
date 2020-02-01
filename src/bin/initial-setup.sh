# -*- sh -*-
#!/bin/bash

set -e -x

bin_path=~/local/bin
mkdir -p $bin_path

files=(clean cmake-learn crescent delta dscp emacs-learn evpn gcc-clean
       git-learn ml store-pwd)

if grep -q Microsoft /proc/version; then
  files+=windows-learn
else
  files+=lock
fi

for f in ${files[@]}; do
    cp $f $bin_path
done
