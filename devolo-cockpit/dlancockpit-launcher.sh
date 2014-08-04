#!/bin/bash

set -e 

if [ "$KDE_FULL_SESSION" = "true" ]; then wm="KDE"; else wm="GNOME"; fi


kdesudo  -d --caption "devolo DLAN Cockpit" --comment "devolo DLAN Cockpit"\
	/opt/devolo/dlancockpit/bin/dlancockpit-run-service-embedded.sh\
 	$DISPLAY $DBUS_SESSION_BUS_ADDRESS $HOME $wm
	