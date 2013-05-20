#!/bin/sh

if [[ ! -d "$HOME/.FreeArc" ]]; then
    install -d $HOME/.FreeArc
    cp /etc/FreeArc/* $HOME/.FreeArc
    cp /usr/lib/FreeArc/scripts/*.lua $HOME/.FreeArc
    sudo chown $USER:$USER $HOME/.FreeArc/*
fi
