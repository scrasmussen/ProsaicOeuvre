#!/usr/bin/env bash
# TODO:
#  * make the command line into a function
#  * look at google shell style guide

N=$'\n'
config_file="$HOME/.tmux.conf"

if [ ! -f $config_file ]; then
    touch $config_file
fi

# change tmux command to C-q
tmux_prefix="set-option -g prefix C-q"
if ! grep -q "^$tmux_prefix" "${config_file}"; then
  sed -i "1s/^/$tmux_prefix \n/" $config_file
fi

# turn off automatic renaming of shell
turnoff_rename="set-option -g allow-rename off"
if ! grep -q "^$turnoff_rename" "${config_file}"; then
  sed -i "1s/^/$turnoff_rename \n/" $config_file
fi

# make sure copy key-bindings are emacs
mode_keys="set-window-option -g mode-keys emacs"
if ! grep -q "^$mode_keys" "${config_file}"; then
  sed -i "1s/^/$mode_keys \n/" $config_file
fi

# turn on mouse scrolling
scroll="set -g mouse on"
if ! grep -q "^$scroll" "${config_file}"; then
  sed -i "1s/^/$scroll \n/" $config_file
fi

# turn on aggressive resizing
resize="setw -g aggressive-resize on"
if ! grep -q "^$resize" "${config_file}"; then
  sed -i "1s/^/$resize \n/" $config_file
fi

# clone plugin manager repo
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

command="set -g @plugin 'tmux-plugins/tpm'"
if ! grep -q "^$command" "${config_file}"; then
  echo "${N}${command}" >> "${config_file}"
fi

command="set -g @plugin 'tmux-plugins/tmux-sensible'"
if ! grep -q "^$command" "${config_file}"; then
  echo "${N}${command}" >> "${config_file}"
fi

command="set -g @plugin 'tmux-plugins/tmux-yank'"
if ! grep -q "^$command" "${config_file}"; then
  echo "${N}${command}" >> "${config_file}"
fi

command="run -b ~/.tmux/plugins/tpm/tpm"
if ! grep -q "^$command" "${config_file}"; then
  echo "${N}# Init plugin manager. Keep at the bottom of tmux.conf" >> "${config_file}"
  echo "${command}" >> "${config_file}"
fi

echo "Fin"
