#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/magmakeys/daemon.conf

PID=`pidof -o %PPID -x /usr/bin/magmakeys`

CMD="/usr/bin/magmakeys --keydir $KEYDIR"

if [ $HAL -eq 0 ]; then
	CMD="$CMD --nohal --dev $DEVICE"
fi

case "$1" in
    start)
        stat_busy "Starting Magmakeys"
        [ -z "$PID" ] && [[ -z `$CMD &> /var/log/magmakeys.log &` ]]
        if [ $? -gt 0 ]; then
            stat_fail
        else
            add_daemon magmakeys
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping Magmakeys"
        [ ! -z "$PID" ] && kill $PID > /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon magmakeys
            stat_done
        fi
        ;;
    restart)
        $0 stop
        sleep 3
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        echo "Settings file: /etc/magmakeys/conf"
        ;;
esac
exit 0

