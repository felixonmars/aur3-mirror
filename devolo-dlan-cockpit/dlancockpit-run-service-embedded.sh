#!/bin/bash

set -e

export DISPLAY=$1
export DBUS_SESSION_BUS_ADDRESS=$2
export HOME=$3
if [ "$4" = "KDE" ]; then
	export KDE_FULL_SESSION=true
	export KDE_SESSION_VERSION=4
else
	export DESKTOP_SESSION=gnome
	export GNOME_DESKTOP_SESSION_ID=1
fi


systemctl restart devolonetsvc
sudo  -u $SUDO_USER  -E /opt/devolo/dlancockpit/bin/dlancockpit-run.sh
systemctl stop devolonetsvc

