#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/moothy ] && . /etc/conf.d/moothy

case "$1" in
  start)
    stat_busy "Starting moothy daemon..."
    /usr/bin/moothy -p /var/run/moothy.pid -t $TIME -d $DEVICES -f $SUSPEND_SCRIPT -w $WINDOWS $E_FLAG &>/dev/null &
    if [ $? -ne 0 ]; then
	stat_fail
    else
	add_daemon moothy
	stat_done
    fi
	;;
  stop)
    stat_busy "Stoping moothy daemon..."
    kill `cat /var/run/moothy.pid` &>/dev/null
    rm_daemon moothy
    stat_done
	;;
  *)
	echo "usage: $0 {start|stop}"
esac
exit 0
