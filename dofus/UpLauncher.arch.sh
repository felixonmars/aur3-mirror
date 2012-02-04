#!/bin/bash

# Script to start Dofus' UpLauncher on Arch Linux
# Adds some environment variales on 64-bit systems

SCRIPT_PATH=`readlink -f $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`

if [ "`uname -m`" == "x86_64" ]; then
	export GTK_PATH=/usr/lib32/gtk-2.0
	export G_FILENAME_ENCODING=UTF-8
fi

$SCRIPT_DIR/UpLauncher $*
