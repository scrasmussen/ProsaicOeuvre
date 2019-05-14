#!/bin/bash
function run(){
  echo $*
  eval $*
}


email='s.c.rasmussen@gmail.com'
git config --global user.name "Soren Rasmussen"
git config --global user.email ${email}

if [[ $1 == "-print" ]]; then
  run "cat ~/.ssh/id_rsa.pub"
fi

# https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
if [[ $1 == "-ssh-gen"  ]]; then
  run "ssh-keygen -t rsa -b 4096 -C ${email}"
fi

# https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
if [[ $1 == "-ssh"  ]]; then
  run 'eval "$(ssh-agent -s)"'
  run 'ssh-add ~/.ssh/id_rsa'
fi

if [[ $1 == "-help"  ]]; then
  echo "-help    : show options"
  echo "-print   : print ssh key for adding to github"
  echo "-ssh     : adding ssh key to ssh-agent"
  echo "-ssh-gen : generate a new ssh key"
fi
