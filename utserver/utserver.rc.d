#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/utserver

[[ -f /var/run/utserver.pid ]] && PID=$(cat /var/run/utserver.pid)
[[ -d /proc/$PID ]] || PID=

case "$1" in
    start)
        stat_busy "Starting uTorrent-server Daemon"
        [[ -z $PID ]] && su -l -s /bin/sh -c "/usr/bin/utserver >/dev/null" $UTSERVER_USER
        if [ $? -gt 0 ]; then
            stat_fail
        else
            sleep 1
            echo $(pgrep -u $UTSERVER_USER utserver) > /var/run/utserver.pid
            add_daemon utserver
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping uTorrent-server Daemon"
        [[ ! -z $PID ]] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm /var/run/utserver.pid
            rm_daemon utserver
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
