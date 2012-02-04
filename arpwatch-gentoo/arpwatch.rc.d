#!/bin/bash

 . /etc/rc.conf
 . /etc/rc.d/functions
 . /etc/conf.d/arpwatch

PID=$(pidof -o %PPID /usr/bin/arpwatch)
case "$1" in
start)
    stat_busy "Starting arpwatch"
    [ -z "$PID" ] && arpwatch ${ARPWATCH_ARGS}
    if [ $? -gt 0 ]; then
        stat_fail
    else
        add_daemon arpwatch
        stat_done
    fi
;;
stop)
    stat_busy "Stopping arpwatch"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
        stat_fail
    else
        rm_daemon arpwatch
        stat_done
    fi
;;
restart)
    $0 stop
    sleep 1
    $0 start
;;
*)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
