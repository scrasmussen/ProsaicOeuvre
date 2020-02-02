#!/usr/bin/env bash

set -e -x


org_url=https://code.orgmode.org/bzg/org-mode/archive/release_8.3.6.tar.gz
org_path=~/tar/org-mode

# prepare for download and install
if ! type makeinfo > /dev/null; then
  echo "enter $ sudo apt install texinfo"
  exit
fi
mkdir -p ~/tar


wget -O ~/tar/org_8.3.6.tar.gz $org_url
tar -C ~/tar -zxf ~/tar/org_8.3.6.tar.gz
echo "ORG_ADD_CONTRIB = org-*" >> $org_path/mk/default.mk

# need to copy org-drill into ~/tar/org-mode/contrib/lisp/

make -C $org_path
make -C install $org_path
