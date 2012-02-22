#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=dircproxy
ARGS=

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

case "$1" in
    start)
        stat_busy "Starting $DAEMON"
        ck_daemon $DAEMON && $DAEMON $ARGS
        if [ $? = 0 ]; then
            add_daemon $DAEMON
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;

    stop)
        stat_busy "Stopping $DAEMON"
        ! ck_daemon $DAEMON && kill $(cat /var/run/$DAEMON.pid)
        if [ $? = 0 ]; then
            rm_daemon $DAEMON
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;
    
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    
    reload)
        stat_busy "Reloading $DAEMON daemon"
        ! ck_daemon $DAEMON && kill -HUP $(cat /var/run/$DAEMON.pid)
        if [ $? = 0 ]; then
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;
    
    *)
        echo "usage: $0 {start|stop|restart}"  
esac
