#!/bin/sh

#Pando downloader launcher

export GTK_PATH=/opt/lib32/usr/lib/gtk-2.0
export PANGO_RC_FILE=/opt/lib32/config/pango/pangorc
export GDK_PIXBUF_MODULE_FILE=/opt/lib32/config/gdk/gdk-pixbuf.loaders
export GTK_IM_MODULE_FILE=/opt/lib32/config/gdk/gdk.immodules
export G_FILENAME_ENCODING=UTF-8

PANDO_HOME=/opt/pando
PANDODL=$PANDO_HOME/bin/pandoDownloader
PD_LIB_PATH=$PANDO_HOME/lib
LD_LIBRARY_PATH=/opt/lib32/usr/lib

export LD_LIBRARY_PATH=${PD_LIB_PATH}:${LD_LIBRARY_PATH}

exec $PANDODL $@