#!/bin/sh

# lib32 environment variables
export LD_LIBRARY_PATH="/usr/lib32/:$LD_LIBRARY_PATH"
export GCONV_PATH="/usr/lib32/gconv/"
export GTK_PATH="/usr/lib32/gtk-2.0/"
export GTK_IM_MODULE_FILE="/etc/gtk-2.0/gtk.immodules-32"

# Run
cd /opt/vuescan
exec "./vuescan"

