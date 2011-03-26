#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
    start)
        stat_busy "Starting MoBlock"
        if [ ! -f /var/run/moblock.pid ]
        then
            /usr/bin/moblock-nfq &
            if [ $? -gt 0 ]
            then
                stat_fail
            else
                add_daemon moblock
                stat_done
            fi
        else
            stat_fail
        fi
        ;;
    update)
        stat_busy "Updating MoBlock block list..."
        error=0
        /usr/bin/moblock-update || error=1
        stat_busy "Updating MoBlock block list"
        if [ $error -eq 1 ]; then
            stat_fail
        else
            stat_done
        fi
        ;;
    stats)
        stat_busy "Logging stats to /var/log/MoBlock.stats"
        PID=`cat /var/run/moblock.pid 2>/dev/null`
        if [ ! -z "$PID" ]; then
            /bin/kill -USR2 $PID
            if [ $? -gt 0 ]; then
                stat_fail
            else
                stat_done
            fi
        else
            stat_fail
        fi
        ;;
    stop)
        stat_busy "Stopping MoBlock"
        PID=`cat /var/run/moblock.pid 2>/dev/null`
        if [ ! -z "$PID" ]; then
            /bin/kill $PID
            if [ $? -gt 0 ]; then
                stat_fail
            else
                rm_daemon moblock
                stat_done
            fi
        else
            stat_fail
        fi
        ;;
    restart)
        $0 stop
        sleep 2
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart|update|stats}"
esac
