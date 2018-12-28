#!/usr/bin/env bash
# TODO:
#  * make the command line into a function
#  * look at google shell style guide

N=$'\n'
CONFIG="$HOME/.tmux.conf"

# change tmux command to C-q
tmux_prefix="set-option -g prefix C-q"
if ! grep -q "^$tmux_prefix" "${CONFIG}"; then
    echo "${N}${tmux_prefix}" >> "${CONFIG}"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

command="set -g @plugin 'tmux-plugins/tpm'"
if ! grep -q "^$command" "${CONFIG}"; then
    echo "${N}${command}" >> "${CONFIG}"
fi

command="set -g @plugin 'tmux-plugins/tmux-sensible'"
if ! grep -q "^$command" "${CONFIG}"; then
    echo "${N}${command}" >> "${CONFIG}"
fi

command="set -g @plugin 'tmux-plugins/tmux-yank'"
if ! grep -q "^$command" "${CONFIG}"; then
    echo "${N}${command}" >> "${CONFIG}"
fi

command="run -b ~/.tmux/plugins/tpm/tpm"
if ! grep -q "^$command" "${CONFIG}"; then
    echo "${N}# Init plugin manager. Keep at the bottom of tmux.conf" >> "${CONFIG}"
    echo "${command}" >> "${CONFIG}"
fi

echo "Fin"
