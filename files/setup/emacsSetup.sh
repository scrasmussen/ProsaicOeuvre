#!/usr/bin/env bash
set -e -x
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


# setup PowerShell major mode
url=http://www.emacswiki.org/emacs/download/PowerShell-Mode.el
autopair_dir=~/.emacs.d/powershell
autopair_file=~/.emacs.d/powershell/PowerShell-Mode.el
[[ -d ${autopair_dir}  ]] || mkdir -p ${autopair_dir}
[[ -f ${autopair_file} ]] || wget -P ${autopair_dir} ${url}
emacs -batch -f batch-byte-compile ${autopair_file}
add "(load-file \"${autopair_file}\")"
if ! grep -q "powershell-mode" "${config_file}"; then
  echo -n "(add-to-list 'auto-mode-alist '("'"' >> ${config_file}
  echo -n '\\''.ps1''\\'"'"'"' >> ${config_file}
  echo " . powershell-mode))" >> ${config_file}
fi


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
add "(require 'column-enforce-mode)"
add "(add-hook 'prog-mode-hook 'column-enforce-mode)"


# setup tab width and space as tabs
# http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
func="(defun my-setup-indent (n)"
if ! grep -q "^$func" "${config_file}"; then
    echo "${N}$func" >> ${config_file}
    echo "  ;; c/c++/java"
    echo "  (setq-local c-basic-offset n)"
    echo "  ;; fortran"
    echo "  (setq-local fortran-basic-offset n))"
fi

func="(defun my-personal-code-style ()"
if ! grep -q "^$func" "${config_file}"; then
    echo "${N}$func" >> ${config_file}
    echo "  (interactive)" >> ${config_file}
    echo "  ;; use space instead of tabs" >> ${config_file}
    echo "  (setq indent-tab-mode nil)" >> ${config_file}
    echo "  ;; indent 2 spaces width" >> ${config_file}
    echo "  (my-setup-indent 2))" >> ${config_file}
    echo "(my-personal-code-style)" >> ${config_file}
fi


# add elpa repo
org="https://orgmode.org/elpa"
package="(add-to-list 'package-archives '(\"org\" . \"${org}\") t)"
if ! grep -q "^${package}" "${config_file}"; then
    echo "${N}(require 'package)" >> ${config_file}
    echo "${package}" >> ${config_file}
fi

echo "FIN"
echo "Now 'M-x list-packages' and install org"
