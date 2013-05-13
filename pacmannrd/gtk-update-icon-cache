#!/bin/bash
#. /etc/pacmannrd.conf
GICI="/tmp/.icanhaziconcacheupdate" 
if [ "$1" == "--transaction-finished" ]; then
	if [ -f "$GICI" ]; then
		counter=$(<"$GICI")
		echo "gtk-update-icon-cache requested ${counter} times"
		echo "running gtk-update-icon-cache"
		gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor 
		rm "$GICI"
	fi
else
	if [ ! -f "$GICI" ]; then
		counter=1
	else
		counter=$(<"$GICI")
		((counter++))
	fi
	echo -n $counter>"$GICI"
	#echo "gtk-update-icon-cache requested ${counter} times"
fi
