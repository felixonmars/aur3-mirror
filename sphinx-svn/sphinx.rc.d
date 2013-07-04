#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/sphinx

PID=$(pidof -o %PPID /usr/bin/sphinx-searchd)
case $1 in
start)
        stat_busy "Starting Sphinx Daemon"
        /usr/bin/mkdir -p /var/run/sphinx

        if [[ -z $PID ]] && /usr/bin/sphinx-searchd $SPHINX_ARGS; then

                PID=$(pidof -o %PPID /var/run/sphinx/searchd.pid)
                echo "$PID" > /var/run/sphinx/searchd.pid
                add_daemon sphinx
                stat_done
        else
                stat_fail
                exit 1
        fi
        ;;

stop)
        stat_busy "Stopping Sphinx Daemon"
        if [[ ! -z $PID ]]  && kill "$PID" &>/dev/null; then
                rm_daemon sphinx
                stat_done
        else
                stat_fail
                exit 1
        fi
        ;;

restart)
        $0 stop
        $0 start
        ;;

*)
        echo "Usage: $0 {start|stop|restart}" >&2
        exit 1
esac
