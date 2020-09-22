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

# add melpa repo
add "(add-to-list 'package-archives '(\"melpa\" . \"http://melpa.org/packages/\") t)"

# add column and row numbers
add "(setq column-number-mode t)"
add "(add-hook 'before-save-hook 'delete-trailing-whitespace)"
add "(setq visible-bell 1)"

# easy switch between windows
add "(windmove-default-keybindings)"

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
    echo "  ;; c/c++/java" >> ${config_file}
    echo "  (setq-local c-basic-offset n)" >> ${config_file}
    echo "  ;; fortran" >> ${config_file}
    echo "  (setq-local fortran-basic-offset n))" >> ${config_file}
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


# add org that works with org-drill
add "(require 'cl)"
add "(require 'org)"
add "(require 'org-drill)"
add "(require 'reftex)"

# setting up latex
add "(setq TeX-auto-save t)"
add "(setq TeX-parse-self t)"
add "(latex-preview-pane-enable)"
add "(setq reftex-plug-into-AUCTeX t)"
add "(setq-default latex-preview-pane-multifile-mode 'auctex)"

add "(add-hook 'LaTeX-mode-hook 'toggle-frame-fullscreen)"
add "(add-hook 'latex-mode-hook 'toggle-frame-fullscreen)"
add "(add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)"
add "(add-hook 'latex-mode-hook 'turn-off-auto-fill)"
add "(add-hook 'LaTeX-mode-hook 'toggle-frame-fullscreen)"
add "(add-hook 'latex-mode-hook 'toggle-frame-fullscreen)"
add "(add-hook 'LaTeX-mode-hook 'column-enforce-mode)"
add "(add-hook 'latex-mode-hook 'column-enforce-mode)"
add "(add-hook 'LaTeX-mode-hook 'turn-on-reftex)"
add "(add-hook 'latex-mode-hook 'turn-on-reftex)"
add "(add-hook 'LaTeX-mode-hook 'turn-on-reftex)"
add "(add-hook 'latex-mode-hook 'turn-on-reftex)"





# ==== current usage =====
# (setq-default latex-preview-pane-multifile-mode 'auctex)
# (add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
#
# (require 'cnfonts)
# (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))


# https://emacs.stackexchange.com/questions/5939/how-to-disable-auto-indentation-of-new-lines
add "(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))"


# add elpa repo
# org="https://orgmode.org/elpa"
# package="(add-to-list 'package-archives '(\"org\" . \"${org}\") t)"
# if ! grep -q "^${package}" "${config_file}"; then
#     echo "${N}(require 'package)" >> ${config_file}
#     echo "${package}" >> ${config_file}
# fi



echo "FIN"
echo "NOW: Run # orgSetup.sh"
echo "Now 'M-x list-packages' and install latex-preview-pane"
echo "                            install auctex"
echo "                            install org-drill"

echo "
(defun LaTeX-preview-pane-enable ()
   \"Enable `latex-preview-pane-mode' in `latex-mode'.\"
   (add-hook 'LaTeX-mode-hook (lambda () (latex-preview-pane-mode 1))))
(LaTeX-preview-pane-enable)"

# this is oldish, probably can remove
# echo "Now 'M-x list-packages' and install org"
# need this for latex-preview-pane
# echo "check end of emacsSetup.sh for info on melpa"




#============================
# (require 'package)
# (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
#                     (not (gnutls-available-p))))
#        (proto (if no-ssl "http" "https")))
#   (when no-ssl
#     (warn "\
# Your version of Emacs does not support SSL connections,
# which is unsafe because it allows man-in-the-middle attacks.
# There are two things you can do about this warning:
# 1. Install an Emacs version that does support SSL and be safe.
# 2. Remove this warning from your init file so you won't see it again."))
#   ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
#   (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
#   ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
#   (when (< emacs-major-version 24)
#     ;; For important compatibility libraries like cl-lib
#     (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
# (package-initialize)




# ---- manual add now ----
# (set-default-font "Menlo 18")
# (require 'reftex)
# (setq reftex-plug-into-AUCTeX t)


# ;; (latex-preview-pane-enable)
# (add-hook 'LaTeX-mode-hook (lambda () (latex-preview-pane-mode 1)))
# (add-hook 'latex-mode-hook (lambda () (latex-preview-pane-mode 1)))
# (add-hook 'LaTeX-mode-hook 'toggle-frame-fullscreen)
# (add-hook 'latex-mode-hook 'toggle-frame-fullscreen)
# (add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)
# (add-hook 'latex-mode-hook 'turn-off-auto-fill)
# (add-hook 'LaTeX-mode-hook 'column-enforce-mode)
# (add-hook 'latex-mode-hook 'column-enforce-mode)
# (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
# (add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode


# (setq-default latex-preview-pane-multifile-mode 'auctex)
