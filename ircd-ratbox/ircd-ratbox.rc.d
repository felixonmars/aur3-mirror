#!/bin/bash
 
NAME=ircd
DAEMON=/usr/sbin/ircd
PIDFILE=/var/run/$NAME.pid
 
. /etc/rc.conf
. /etc/rc.d/functions
 
PID="`cat $PIDFILE 2>/dev/null || pidof $DAEMON`"
case "$1" in
    start)
        stat_busy "Starting ircd-ratbox"
        kill -0 $PID 2>/dev/null || su ircd -c "$DAEMON -pidfile $PIDFILE"
        if [ $? -gt 0 ]; then
            stat_fail
        else
            add_daemon $NAME
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping ircd-ratbox"
        kill $PID 2>/dev/null
        if kill $PID 2>/dev/null; then
            rm $PIDFILE 2>/dev/null
            rm_daemon $NAME
            stat_done
        else
            stat_fail
        fi
        ;;
    restart|force-reload)
        $0 stop
        $0 start
        ;;
    config-test)
        `su ircd -c "$DAEMON -conftest"`
        ;;
    *)
        echo "usage: $0 {start|stop|restart|config-test}"
esac
exit 0
