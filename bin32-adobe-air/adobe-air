#!/bin/bash
# Simple Adobe Air SDK wrapper script to use it as a simple AIR application launcher
# By Spider.007 / Sjon

if [[ -z "$1" ]]
then
	echo "Please supply an .air application as first argument"
	exit 1
fi

export GTK_PATH=/opt/lib32/usr/lib/gtk-2.0
export PANGO_RC_FILE=/opt/lib32/config/pango/pangorc
export GDK_PIXBUF_MODULE_FILE=/opt/lib32/config/gdk/gdk-pixbuf.loaders
export GTK_IM_MODULE_FILE=/opt/lib32/config/gdk/gdk.immodules
export G_FILENAME_ENCODING=UTF-8

tmpdir=`mktemp -d /tmp/adobeair.XXXXXXXXXX`

echo "adobe-air: Extracting application to directory: $tmpdir"
mkdir -p $tmpdir
unzip -q $1 -d $tmpdir || exit 1

echo "adobe-air: Attempting to start application"
/opt/adobe-air-sdk/bin/adl -nodebug $tmpdir/META-INF/AIR/application.xml $tmpdir

echo "adobe-air: Cleaning up temporary directory"
rm -Rf $tmpdir && echo "adobe-air: Done"
