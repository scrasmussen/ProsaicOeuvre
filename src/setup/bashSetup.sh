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

c_path='export C=/mnt/c/Users/scras/Documents'
add "$c_path"

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

emacs="alias emacs='emacs -nw'"
add "$emacs"

gmacs='gmacs() { echo "running gmacs"; /usr/bin/emacs "$@" -fh -fw & }'
gmacs='gmacs() { echo "starting gmacs"; /usr/bin/emacs "$@" -fs & }'
add "$gmacs"

start='start() { cd $HOME/Documents/cranfield/org; start-script; }'
add "$start"

# gmacs="alias gmacs='$(which emacs) -fs'"
# add "$gmacs"

echo "Need to work on toilet"

# toilet -f term -F border "From stressed, to jest."
# toilet -f term -F border "Chop wood, carry water."

# toilet -f term -F border "From stressed, to blessed."
# toilet -f term -F border "Hello, Soren. You're looking well today."
# str="Remember, procrastination is about managing emotions not time."
# toilet -f term -F border ${str}

# days=$(expr $(date -d "Dec 25"  +%j) - $(date +%j))
# weeks=$(expr $(date -d "Dec 25"  +%U) - $(date +%U))
# months=$(expr $(date -d "Dec 25"  +%m) - $(date +%m))
# toilet -f term -F border "${days} days | ${weeks} weeks | ${months} months"


# NOT SURE ABOUT THIS, LOOK INTO MORE
# alias ipython='tmux-ipython.sh'

echo "Fin"
