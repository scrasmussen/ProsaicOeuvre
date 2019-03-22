#!/usr/bin/env bash

# set ding to visual
ding="set bell-style visible"
if ! grep -q "^$ding"  "/etc/inputrc"; then
  sed -i -e "\$a$ding" /etc/inputrc

fi

bashrc="${HOME}/.bashrc"
prompt='PS1="C:\>"'
if grep -q "^$prompt" "${bashrc}"; then
  sed -i "1s/^/$prompt \n/" $bashrc
fi

# change less settings
less_alias="alias less='less --silent --ignore-case --status-column'"
if ! grep -q "^$less_alias" "${bashrc}"; then
  sed -i -e "\$a$less_alias" $bashrc
fi

# caps is ctrl
setxkbmap -layout us -option ctrl:nocaps
# edit /etc/default/keyboard so XKBOPTIONS="ctrl:nocaps"


C=/mnt/c/Users/Artless/Documents
U=$C/unix
EXPORTC=$'export C=/mnt/c/Users/Artless/Documents'
EXPORTU=$'export U=$C/unix'
EXPORTPATH=$'export PATH=$U/local/bin:$PATH'
CDU=$'cd $U'
echo "${EXPORTC}"
echo "${EXPORTU}"
echo "${EXPORTPATH}"
echo "${CDU}"

echo "Fin"
