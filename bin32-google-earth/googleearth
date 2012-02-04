#!/bin/bash
GOOGLEEARTH_DATA_PATH="/opt/google-earth"

GTK_IM_MODULE=xim
QT_IM_MODULE=xim
GCONV_PATH=/usr/lib32/gconv/
GDK_PIXBUF_MODULE_FILE=/etc/gtk-2.0/gdk-pixbuf.loaders-32
GTK_IM_MODULE_FILE=/etc/gtk-2.0/gtk.immodules-32
GTK_PATH=/usr/lib32/gtk-2.0/
LD_LIBRARY_PATH="${GOOGLEEARTH_DATA_PATH}:/usr/lib32/:$LD_LIBRARY_PATH"
PANGO_RC_FILE="${GOOGLEEARTH_DATA_PATH}/pangorc"
export GCONV_PATH GDK_PIXBUF_MODULE_FILE GTK_IM_MODULE_FILE GTK_PATH LD_LIBRARY_PATH PANGO_RC_FILE
export GTK_IM_MODULE QT_IM_MODULE

cd "${GOOGLEEARTH_DATA_PATH}/"


# Fix for languages that use , instead of . for separating thousands from hundreds in numbers
LANGUAGES_AFFECTED="de_DE fr_FR it_IT"
SYSTEM_LANGUAGE=`echo ${LANG/.*}`
if [ `echo ${LANGUAGES_AFFECTED} | grep -c ${SYSTEM_LANGUAGE}` -gt 0 ]; then
	export LC_NUMERIC=en_US.UTF8
fi


exec "./googleearth-bin" $*
