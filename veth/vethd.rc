#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/vethd ] && . /etc/conf.d/vethd

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof /usr/bin/vethd`
case "$1" in
        start)
                stat_busy "Starting vethd"
                if [ -z "$PID" ]; then
                        /usr/bin/vethd $VETHD_ARGS >/dev/null &
                        PID=`pidof /usr/bin/vethd`
                        if [ -z "$PID" ]; then
                                stat_fail
                        else
                                add_daemon vethd
                                stat_done
                        fi
                else
                        stat_fail
                fi
                ;;
        stop)
                stat_busy "Stopping vethd"
                [ ! -z "$PID" ]  && kill $PID &> /dev/null
                if [ $? -gt 0 ]; then
                        stat_fail
                else
                        rm_daemon vethd
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

