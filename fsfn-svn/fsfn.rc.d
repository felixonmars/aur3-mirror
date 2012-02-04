#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
    start)
        stat_busy "Starting Vaio Laptop Hotkey Handler"
        /usr/bin/fsfn &> /dev/null
        if [ $? -ne 0 ]; then
                stat_fail
        else
                add_daemon fsfn
                stat_done 
        fi
        ;;
    stop)
        stat_busy "Stopping Vaio Laptop Hotkey Handler"
        PID=`cat /var/run/fsfn.pid`
        [ ! -z "$PID" ]  && kill $PID &> /dev/null 
        if [ $? -ne 0 ]; then
            stat_fail
        else
            rm_daemon fsfn
            stat_done 
        fi
        ;;
    restart|force-reload)
        $0 stop
        sleep 1
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart|force-reload}"
        exit 1
        ;;
esac
exit 0