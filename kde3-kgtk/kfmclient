#!/bin/bash

LD_PRELOAD=$( echo "$LD_PRELOAD" | sed 's#/opt/kde/lib/kgtk/libkqt3.so:##g' | sed 's#/opt/kde/lib/kgtk/libkqt4.so:##g' )

/opt/kde/bin/kfmclient "$1" "$2"
