#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/sogo
DAEMON=/usr/sbin/sogod
PIDFILE=/run/sogo.pid
PID=$(cat "$PIDFILE" 2>/dev/null)
[ -d /proc/$PID ] || PID=""

start() {
    stat_busy "Starting sogo"
    if [ -z "$PID" ]; then
        touch "$PIDFILE"
        chown "$USER" "$PIDFILE"
        su - "$USER" -c "$DAEMON -WOPidFile $PIDFILE -WOWorkersCount $PREFORK -WOPort $PORT -WOLogFile $LOGFILE" >/dev/null &
        if [ $? -gt 0 ]; then
            stat_fail
        else
            add_daemon sogo
            stat_done
        fi
    else
        stat_die
    fi
}

stop() {
    stat_busy "Stopping sogo"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]
        then
        stat_fail
    else
        rm_daemon sogo
        rm -f "$PIDFILE"
        stat_done
    fi
}

case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  restart)
    $0 stop
    $0 start
	;;
  *)
	echo "usage: $0 {start|stop|restart}"
	exit 1
	;;
esac

exit 0
