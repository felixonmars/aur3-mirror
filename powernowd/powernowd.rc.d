#!/bin/bash

# AUR Credits:
# simple init script the ARCH-way for Powernowd
# Made by, CyberTron, packages@linuxportalen.com

# Modifications by Alexander Baldeck <alexander@archlinux.org>

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/powernowd`

[ -f /etc/conf.d/powernowd ] && source /etc/conf.d/powernowd

case "$1" in
    start)
        stat_busy "Starting Powernowd"
        [ -z "$PID" ] && /usr/sbin/powernowd $OPTIONS 2>/dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
        echo $PID > /var/run/powernowd.pid
            add_daemon powernowd
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping Powernowd"
        [ ! -z "$PID" ]  && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm /var/run/powernowd.pid
            rm_daemon powernowd
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
	;;
esac
exit 0
