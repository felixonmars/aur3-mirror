#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/smartmon ] && . /etc/conf.d/smartmon

case "$1" in
  start)
    stat_busy "Starting smartmon daemon..."
    /usr/bin/smartmon -p /var/run/smartmon.pid -t $TIME -d $DEVICES -f /usr/share/smartmon/$SUSPEND_SCRIPT -w $WINDOWS &>/dev/null &
    if [ $? -ne 0 ]; then
	stat_fail
    else
	add_daemon smartmon
	stat_done
    fi
	;;
  stop)
    stat_busy "Stoping smartmon daemon..."
    kill `cat /var/run/smartmon.pid` &>/dev/null
    rm_daemon smartmon
    stat_done
	;;
  *)
	echo "usage: $0 {start|stop}"
esac
exit 0
