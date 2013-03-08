#!/bin/sh

# see "man emu" for more options

export INFERNOROOT=/opt/inferno-os
export PATH=$PATH:$INFERNOROOT/Linux/386/bin
alias emu="emu -r$INFERNOROOT -g800x600"
