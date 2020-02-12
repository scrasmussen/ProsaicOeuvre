#!/usr/bin/env bash

# set -e -x

N=$'\n'
config_file="$HOME/.bashrc"


function add(){
  if ! grep  "^$@" "${config_file}"; then
    echo "${N}$@" >> ${config_file}
  fi
}


# ---- if Linux add these ----
# set ding to visual
ding="set bell-style visible"
if ! grep -q "^$ding"  "/etc/inputrc"; then
  sed -i -e "\$a$ding" /etc/inputrc
fi
# # caps is ctrl
# setxkbmap -layout us -option ctrl:nocaps
# edit /etc/default/keyboard so XKBOPTIONS="ctrl:nocaps"


prompt='PS1="C:\>"'
add "$prompt"

# change less settings
lessAlias='alias less="less --silent --ignore-case --status-column"'
add "$lessAlias"

python_alias="alias python='python3'"
add "$python_alias"

pip_alias="alias pip='pip3'"
add "$pip_alias"

bin_path='export PATH=$HOME/local/bin:$PATH'
add "$bin_path"

c_path='export C=/mnt/c/Users/scras/Documents'
add "$c_path"

emacs="alias emacs='emacs -nw'"
add "$emacs"

gmacs="alias gmacs='$(which emacs) -fs'"
add "$gmacs"

echo "Need to work on toilet"
# toilet -f term -F border "Hello, Soren. You're looking well today."
# str="Remember, procrastination is about managing emotions not time."
# toilet -f term -F border ${str}

echo "Fin"
