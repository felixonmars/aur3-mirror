#!/bin/sh

if [[ ! -z $GTK_IM_MODULE ]] && [[ "`ps ax|grep $GTK_IM_MODULE`" == '' ]]; then
	$GTK_IM_MODULE -d
fi

GCONV_PATH=/opt/lib32/usr/lib/gconv
GDK_PIXBUF_MODULE_FILE=/opt/lib32/config/gdk/gdk-pixbuf.loaders
GTK_IM_MODULE_FILE=/etc/gtk-2.0/gtk.immodules.32
GTK_MODULES=/opt/lib32/usr/lib/gtk-2.0/modules/libgnomebreakpad.so
GTK_PATH=/opt/lib32/usr/lib/gtk-2.0/
LD_LIBRARY_PATH="/opt/lib32/usr/lib/:/opt/lib32/lib/:$LD_LIBRARY_PATH"
PANGO_RC_FILE=/opt/lib32/config/pango/pangorc
export GCONV_PATH GDK_PIXBUF_MODULE_FILE GTK_IM_MODULE_FILE GTK_PATH LD_LIBRARY_PATH PANGO_RC_FILE

/opt/lib32/prism/prism $*
