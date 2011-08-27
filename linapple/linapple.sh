#!/bin/sh

if [ -z "$XDG_CONFIG_HOME" ]
then
    linhome="$HOME/.config/linapple"
else
    linhome="$XDG_CONFIG_HOME/linapple"
fi

cd $linhome
exec /usr/share/linapple/bin/linapple $*
