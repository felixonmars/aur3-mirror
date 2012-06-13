#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/utserver

PIDFILE=/var/run/utserver/utserver.pid

[ -r "$PIDFILE" ] && PID=$(cat "$PIDFILE")
[ -n "$PID" ] && PID=$(pidof -s /usr/share/utserver/utserver)

case "$1" in
    start)
        stat_busy "Starting uTorrent-server"
        if [ -r "$PIDFILE" ]; then
            stat_die
        else
            mkdir -pm755 $(dirname "$PIDFILE") && chown $UTSERVER_USER $(dirname "$PIDFILE") &&
            su -l -s /bin/sh -c "/usr/bin/utserver $UTSERVER_ARGS >/dev/null 2>&1" $UTSERVER_USER
            if [ $? -gt 0 ]; then
                stat_fail
            else
                add_daemon utserver
                stat_done
            fi
        fi
        ;;
    stop)
        stat_busy "Stopping uTorrent-server"
        [ -n "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            while [ -d /proc/"$PID" ]; do
                sleep 1
            done
            rm -f "$PIDFILE"
            rm_daemon utserver
            stat_done
        fi
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
esac
exit 0
