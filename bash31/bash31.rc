#!/bin/bash

declare _bashdir="/opt/bash31"
export MANPATH+="$_bashdir/man/"
export MANPATH+=":/usr/share/man/"

[[ $- != *i* ]] && return

PS1='[\V:\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

echo 
echo "Running : '${BASH_VERSINFO[@]}'"
echo "You can type ^D or exit to exit."
echo

