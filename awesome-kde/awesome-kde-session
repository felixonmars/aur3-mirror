#!/bin/sh

if test -n "$1"; then
    echo "Syntax: awesome-kde-session"
  exit
fi

# Set the prefix for the menu layout to use
export XDG_MENU_PREFIX="kde-"

# Clean up after GDM
xprop -root -remove _NET_NUMBER_OF_DESKTOPS \
      -remove _NET_DESKTOP_NAMES \
      -remove _NET_CURRENT_DESKTOP 2> /dev/null

# Run KDE with Awesome as its window manager
export KDEWM="/usr/bin/awesome"
exec startkde "$@"
