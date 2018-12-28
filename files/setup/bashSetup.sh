#!/usr/bin/env bash
N=$'\n'

# set ding to visual
ding="set bell-style visible"
if ! grep -q "^$ding"  "/etc/inputrc"; then
    echo "${N}${ding}" >> /etc/inputrc
fi

BASHRC="${HOME}/.bashrc"
PROMPT=$'PS1="C:\>"'
if grep -q "^PS1=" "${BASHRC}"; then
    echo "${N}${PROMPT}" >> "${BASHRC}"
fi

C=/mnt/c/Users/Artless/Documents
U=$C/unix
EXPORTC=$'export C=/mnt/c/Users/Artless/Documents'
EXPORTU=$'export U=$C/unix'
EXPORTPATH=$'export PATH=$U/local/bin:$PATH'
CDU=$'cd $U'
echo "${EXPORTC}"
echo "${EXPORTU}"
echo "${EXPORTPATH}"
echo "${CDU}"

echo "Fin"
