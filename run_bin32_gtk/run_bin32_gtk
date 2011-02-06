#!/bin/bash

GTK_PATH=/opt/lib32/usr/lib/gtk-2.0
GCONV_PATH=/opt/lib32/usr/lib/gconv
PANGO_RC_FILE=/opt/lib32/config/pango/pangorc
GDK_PIXBUF_MODULE_FILE=/opt/lib32/config/gdk/gdk-pixbuf.loaders
LD_LIBRARY_PATH=/opt/lib32/lib/:/opt/lib32/usr/lib/:$LD_LIBRARY_PATH

export GTK_PATH GCONV_PATH PANGO_RC_FILE GDK_PIXBUF_MODULE_FILE LD_LIBRARY_PATH
exec $1 $@
exit 0
