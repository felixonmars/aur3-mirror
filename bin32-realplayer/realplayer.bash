#!/bin/bash

REALPLAY_DATA_DIR="/opt/realplayer"

export GTK_PATH="/opt/lib32/usr/lib/gtk-2.0"
export PANGO_RC_FILE="/opt/lib32/config/pango/pangorc"
export GDK_PIXBUF_MODULE_FILE="/opt/lib32/config/gdk/gdk-pixbuf.loaders"

linux32 "${REALPLAY_DATA_DIR}/realplay" "$@"
