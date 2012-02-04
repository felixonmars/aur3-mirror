#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
  	if [ ! -f "/lib/modules/`uname -r`/updates/drivers/input/mouse/psmouse.ko.gz" ]; then
		/usr/sbin/psmouse-elantech-build
	fi
	;;
  stop)
    ;;
  *)
    echo "usage: $0 {start|stop|restart|force-restart}"
esac
