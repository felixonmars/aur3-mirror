#!/bin/bash
 
NAME=ircd
DAEMON=/usr/sbin/ircd
PIDFILE=/var/run/$NAME.pid
 
. /etc/rc.conf
. /etc/rc.d/functions
 
PID=`pidof -o %PPID $DAEMON`
case "$1" in
    start)
        stat_busy "Starting ircd-ratbox"
        [ -z "$PIDFILE" ] && `su ircd -c "$DAEMON"`
        if [ $? -gt 0 ]; then
            stat_fail
        else
            PID=`pidof -o %PPID $DAEMON`
            echo $PID > $PIDFILE
            add_daemon $NAME
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping ircd-ratbox"
        PID=`cat $PIDFILE`
        kill $PID > /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm $PIDFILE
            rm_daemon $NAME
            stat_done
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
