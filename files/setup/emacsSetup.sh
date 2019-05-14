#!/usr/bin/env bash
N=$'\n'
config_file="$HOME/.emacs"

function add(){
  echo $1
  if ! grep -q "^$1" "${config_file}"; then
    echo "${N}$1" >> ${config_file}
  fi
}

# add column and row numbers
add "(setq column-number-mode t)"
add "(add-hook 'before-save-hook 'delete-trailing-whitespace)"
add "(setq visible-bell 1)"

# setup autopair
url=https://raw.githubusercontent.com/capitaomorte/autopair/master/autopair.el
autopair_dir=~/.emacs.d/autopair
autopair_file=~/.emacs.d/autopair/autopair.el
[[ -d ${autopair_dir}  ]] || mkdir -p ${autopair_dir}
[[ -f ${autopair_file} ]] || wget -P ${autopair_dir} ${url}
emacs -batch -f batch-byte-compile ${autopair_file}
add "(add-to-list 'load-path \"${autopair_dir}\")"
add "(require 'autopair)"
add "(autopair-global-mode)"

# setup highlighting text beyond column 80
url=https://raw.githubusercontent.com/jordonbiondo/column-enforce-mode/master/column-enforce-mode.el
columnEnforce_dir=~/.emacs.d/columnEnforce
columnEnforce_file=~/.emacs.d/columnEnforce/column-enforce-mode.el
[[ -d ${columnEnforce_dir}  ]] || mkdir -p ${columnEnforce_dir}
[[ -f ${columnEnforce_file} ]] || wget -P ${columnEnforce_dir} ${url}
emacs -batch -f batch-byte-compile ${columnEnforce_file}
add "(add-to-list 'load-path \"${columnEnforce_dir}\")"
add "(add-hook 'prog-mode-hook 'column-enforce-mode)"


# --- TODO ---
# how to automatically do meta package-install?
# fix indendation
# https://www.emacswiki.org/emacs/IndentingC#toc1
