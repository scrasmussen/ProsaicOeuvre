#!/usr/bin/env bash
N=$'\n'

tmux_prefix="set-option -g prefix C-q"
if ! grep -q "$tmux_prefix" "$HOME/.tmux.conf"; then
    echo "${N}${tmux_prefix}" >> "$HOME/.tmux.conf"
fi

echo "Fin"
