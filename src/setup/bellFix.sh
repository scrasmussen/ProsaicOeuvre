#!/usr/bin/env bash

# https://www.reddit.com/r/bashonubuntuonwindows/comments/4vuj41/disabling_beep_on_terminal/
touch ~/.inputrc
echo "set bell-style none" >> ~/.inputrc
