#!/usr/bin/env bash

set -e -x
function add(){
  echo $1
  if ! grep -q "^$1" "${config_file}"; then
    echo "${N}$1" >> ${config_file}
  fi
}



org_url=https://code.orgmode.org/bzg/org-mode/archive/release_8.3.6.tar.gz
org_drill_url=https://bitbucket.org/eeeickythump/org-drill/raw/01b05cd7561ad69e5ec9c1200414d4fa128c9a17/org-drill.el



# # prepare for download and install
if ! type makeinfo > /dev/null; then
  echo "enter $ sudo apt install texinfo"
  exit
fi

tar=/home/$SUDO_USER/tar
org_path=$tar/org-mode
mkdir -p $tar

# # download org and org-drill
wget -O $tar/org_8.3.6.tar.gz $org_url
wget -O $tar/org-drill.el     $org_drill_url

# # extract and copy org-drill in
tar -C $tar -zxf $tar/org_8.3.6.tar.gz
echo "ORG_ADD_CONTRIB = ox-* org-*" >> $org_path/mk/default.mk
mv ~/tar/org-drill.el $org_path/contrib/lisp

# make and install
make -C $org_path
make -C $org_path install

# add org path to .emacs
add "(add-to-list 'load-path \"/usr/share/emacs/site-lisp/org\")"

echo "go to org.el to edit verbatim colors"
echo "  - use M-x list-colors-display to see colors"
echo "  - see link https://emacs.stackexchange.com/a/44098"
