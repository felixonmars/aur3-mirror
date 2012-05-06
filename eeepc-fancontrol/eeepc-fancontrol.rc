#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

name=eeepc-fancontrol
PID=$(pidof -x -o %PPID /usr/sbin/eeepc-fancontrol)

case "$1" in
    start)
        stat_busy "Starting $name daemon"
        [[ -z "$PID" ]] && /usr/sbin/eeepc-fancontrol &>/dev/null \
        && { add_daemon $name; stat_done; } \
        || { stat_fail; exit 1; }
        ;;
    stop)
        stat_busy "Stopping $name daemon"
        [[ -n "$PID" ]] && kill $PID &>/dev/null \
        && { rm_daemon $name; stat_done; } \
        || { stat_fail; exit 1; }
        ;;
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        ;;
esac
exit 0
# vim: ft=sh ts=4 et sw=4:
