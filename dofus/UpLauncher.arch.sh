#!/bin/bash

# Script to start Dofus' UpLauncher on Arch Linux
# Adds some environment variales on 64-bit systems

SCRIPT_PATH=`readlink -f $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`

if [ "`uname -m`" == "x86_64" ]; then
	export GTK_PATH=/opt/lib32/usr/lib/gtk-2.0
	export PANGO_RC_FILE=/opt/lib32/config/pango/pangorc
	export GDK_PIXBUF_MODULE_FILE=/opt/lib32/config/gdk/gdk-pixbuf.loaders
	export GTK_IM_MODULE_FILE=/opt/lib32/config/gdk/gdk.immodules
	export G_FILENAME_ENCODING=UTF-8
fi

$SCRIPT_DIR/UpLauncher $*

