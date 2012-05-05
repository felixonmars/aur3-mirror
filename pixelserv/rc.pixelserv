#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
    start)
        stat_busy "Starting pixelserv"
	/usr/bin/perl -Tw /usr/sbin/pixelserv.pl &>/dev/null &
	ps aux | grep -v grep | grep -- "pixelserv" &>/dev/null
        if [ $? -eq 0 ]; then
            add_daemon pixelserv
            stat_done
        else
            stat_fail
        fi
        ;;
    stop)
        if ! ck_daemon pixelserv; then
            stat_busy "Stopping pixelserv"
	    ps aux | grep -v grep | grep -- "pixelserv" | awk '{ print $2 }' | while read LINE; do
		kill $LINE &>/dev/null
	    done
	    if ps aux | grep -v grep | grep -- "pixelserv" &>/dev/null; then
		stat_fail
	    else
                rm_daemon pixelserv
                stat_done
            fi
        fi
        ;;
    restart)
        "$0" stop
        sleep 1
        "$0" start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
exit 0
