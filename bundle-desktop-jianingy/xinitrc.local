#!/bin/bash

/usr/bin/xrdb -load /etc/X11/xinit/Xdefault.local
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export LC_CTYPE="zh_CN.UTF-8"
exec ck-launch-session gnome-session

# vim: ts=2 sw=2 ai et
