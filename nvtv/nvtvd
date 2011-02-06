#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

NVTVD_PID=`pidof -o %PPID /usr/bin/nvtvd`

case "$1" in
    start)
        stat_busy "Starting Nvidia TV-out daemon"
        nvtvd &
	if [ $? -gt 0 ]; then
	    stat_fail
	else
	    add_daemon nvtvd
	    stat_done
	fi
        ;;
    stop)
        stat_busy "Stopping Nvidia TV-out daemon"
        kill $NVTVD_PID > /dev/null 2>&1
	if [ $? -gt 0 ]; then
	    stat_fail
	else
	    rm_daemon nvtvd
	    stat_done
	fi
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        ;;
esac
exit 0