#!/bin/sh
#customize, for emu options (eg. graphics, and more see man emu

export INFERNOROOT=/opt/inferno-os
export PATH=$PATH:$INFERNOROOT/Linux/386/bin
alias emu="emu -r$INFERNOROOT -g800x600"
