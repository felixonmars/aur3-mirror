#!/bin/sh
# Having this variable set can make transition segfault
unset SESSION_MANAGER
export QT_NO_GLIB=1

/opt/ankama/transition/transition "$@"
