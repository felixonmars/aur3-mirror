#!/bin/sh

libdir=/usr/lib

if [[ ! -d "$HOME/.FreeArc" ]]; then
    install -d $HOME/.FreeArc
    cp /etc/FreeArc/* $HOME/.FreeArc
    cp $libdir/FreeArc/scripts/*.lua $HOME/.FreeArc
    sudo chown $USER:$USER $HOME/.FreeArc/*
fi
