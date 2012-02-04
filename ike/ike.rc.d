#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/iked`

case $1 in

    start)
        if [[ -z $PID ]] && /usr/sbin/iked; then
            stat_busy 'Starting IKE daemon'
            PID=`pidof -o %PPID /usr/sbin/iked`
            add_daemon iked
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;

    stop)
        stat_busy 'Stopping IKE daemon'
        if [[ -n $PID ]] && kill $PID &>/dev/null; then
            rm_daemon iked
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;

    restart)
        $0 stop
        $0 start
        ;;

    *)
        echo "Usage: $0 {start|stop|restart}" >&2
        exit 1
        ;;

esac
