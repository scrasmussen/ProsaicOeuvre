#!/usr/bin/env bash
# TODO:
#  * make the command line into a function
#  * look at google shell style guide

# set -e -x

N=$'\n'
config_file="$HOME/.tmux.conf"

function add(){
  if ! grep  "^$@" "${config_file}"; then
    echo "${N}$@" >> ${config_file}
  fi
}

if [ ! -f $config_file ]; then
    touch $config_file
fi

# change tmux command to C-q
tmux_prefix="set-option -g prefix C-q"
add "$tmux_prefix"

# turn off automatic renaming of shell
turnoff_rename="set-option -g allow-rename off"
add "$turnoff_rename"

# make sure copy key-bindings are emacs
mode_keys="set-window-option -g mode-keys emacs"
add "$mode_keys"

# turn on mouse scrolling
scroll="set -g mouse on"
add "$scroll"

# turn on aggressive resizing
resize="setw -g aggressive-resize on"
add "$resize"

# clone plugin manager repo
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

command="set -g @plugin 'tmux-plugins/tpm'"
add "$command"

command="set -g @plugin 'tmux-plugins/tmux-sensible'"
add "$command"

command="set -g @plugin 'tmux-plugins/tmux-yank'"
add "$command"

london='GMT #(TZ=\"Europe/London\" date +%%H:%%M)'
pacific='PST #(TZ=\"US/Pacific\" date +%%H:%%M)'
t_display="#[bg=blue, fg=black] $(pacific)| $(london)"
status="set -g status-right '$t_display'"
add "$status"

# remap prefix from 'C-b' to 'C-a'
command="unbind C-b"
if ! grep -q "^$command" "${config_file}"; then
  echo "${command}" >> "${config_file}"
  echo "set-option -g prefix C-q" >> "${config_file}"
  echo "bind-key C-q send-prefix" >> "${config_file}"
fi

command="run -b ~/.tmux/plugins/tpm/tpm"
if ! grep -q "^$command" "${config_file}"; then
  echo "${N}# Init plugin manager. Keep at the bottom of tmux.conf" >> "${config_file}"
  echo "${command}" >> "${config_file}"
fi

echo "Almost Fin, now run"
echo "# sudo apt install xclip"
echo "Use prefix-I to install plugins"
echo "$ tmux source-file ~/.tmux.conf"
