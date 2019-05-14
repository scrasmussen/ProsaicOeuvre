#!/usr/bin/env bash
N=$'\n'
config_file="$HOME/.emacs"

function add(){
  if ! grep -q "^$1" "${config_file}"; then
    echo "${N}$1" >> ${config_file}
  fi
}

# add column and row numbers
add "(setq column-number-mode t)"
# highlight text beyond column 80
add "(add-hook 'prog-mode-hook 'column-enforce-mode)"
add "(add-hook 'before-save-hook 'delete-trailing-whitespace)"
add "(setq visible-bell 1)"

# handle autopair
if ! grep -q "^(require 'autopair)"; then
  url=https://raw.githubusercontent.com/capitaomorte/autopair/master/autopair.el
  autopair_dir=~/.emacs.d/autopair
  autopair_file=~/.emacs.d/autopair/autopair.el
  [[ -d ${autopair_dir} ]] || mkdir -p ${autopair_dir}
  [[ -f ${autopair_file} ]] || wget -P ${autopair_dir} ${url}
  emacs -batch -f batch-byte-compile ${autopair_file}
  add "(add-to-list 'load-path \"${autopair_dir}\")"
  add "(require 'autopair)"
  add "(autopair-global-mode)"
fi


# --- TODO ---
# how to automatically do meta package-install?
# fix indendation
# https://www.emacswiki.org/emacs/IndentingC#toc1
