#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON_DIR=/opt/buddycloud-http-api
DAEMON_USER=nobody

PIDFILE=/run/buddycloud-http-api.pid
if [[ -r "$PIDFILE" ]]; then
    read -r PID < "$PIDFILE"
    if [[ $PID && ! -d /proc/$PID ]]; then
        # stale pidfile
        unset PID
        rm -f "$PIDFILE"
    fi
fi

case "$1" in
    start)
        stat_busy 'Starting buddycloud HTTP API'
        [[ ! -z $PID ]] && { stat_fail; exit 1; }
        start-stop-daemon --start --background --make-pidfile --pidfile "$PIDFILE" \
            --chuid $DAEMON_USER --chdir $DAEMON_DIR \
            --exec /bin/bash -- -c "/usr/bin/node ./server.js >>/var/log/buddycloud-http-api.log 2>&1"
        if [[ $? -gt 0 ]]; then
            stat_fail
            exit 1
        else
            add_daemon buddycloud-http-api
            stat_done
        fi
        ;;
    stop)
        stat_busy 'Stopping buddycloud HTTP API'
        [[ -z $PID ]] && { stat_fail; exit 1; }
        start-stop-daemon --stop --pidfile "$PIDFILE" \
            --retry=TERM/5/KILL/5 --user $DAEMON_USER
        if [[ $? -gt 0 ]]; then
            stat_fail
            exit 1
        else
            rm -f "$PIDFILE"
            rm_daemon buddycloud-http-api
            stat_done
        fi
        ;;
    restart)
        $0 stop
        sleep 3
        $0 start
        ;;
    status)
        stat_busy "Checking buddycloud HTTP API status"
        ck_status buddycloud-http-api
        ;;
    *)
        echo "usage: $0 {start|stop|restart|status}"
esac
