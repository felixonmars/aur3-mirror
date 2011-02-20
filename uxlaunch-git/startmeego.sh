#!/bin/sh

export GCONF_DEFAULT_SOURCE_PATH=/etc/gconf/2/meego.path
export XDG_MENU_PREFIX=meego-
export XDG_DATA_DIRS=$HOME/.local/share/applications:/usr/share
 
# load modmap settings
test -r /etc/X11/Xmodmap && xmodmap /etc/X11/Xmodmap
test -r $HOME/.Xmodmap && xmodmap $HOME/.Xmodmap
 
exec /usr/sbin/uxlaunch -x -v > ~/.uxlaunch.log 2>&1
