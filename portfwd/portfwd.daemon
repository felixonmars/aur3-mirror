#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

CONFIG_FILE="/etc/portfwd.cfg"

case "$1" in
    start)
        stat_busy "Starting Port Forwarding Daemon"
        /usr/sbin/portfwd --config "$CONFIG_FILE"
        if [ $? -gt 0 ]; then
            stat_fail
        else
            add_daemon portfwd
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping Port Forwarding Daemon"
        daemon_pid=$(ps ax | grep portfwd | grep -- "--config $CONFIG_FILE" | cut -c 1-6 | sort | head -n 1)
        kill -s TERM $daemon_pid &>/dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon portfwd
            stat_done
        fi
        ;;
    restart)
        $0 stop
	sleep 1
        $0 start
        ;;
    reload)
	$0 restart
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
	;;
esac
exit 0
