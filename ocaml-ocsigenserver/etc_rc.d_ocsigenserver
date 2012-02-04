#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

OCSIGEN_USER=ocsigen
OCSIGEN_BIN=/usr/bin/ocsigenserver
OCSIGEN_PIPE=/var/run/ocsigenserver_command

if [ ! -x "$OCSIGEN_BIN" ] ; then
    echo "$OCSIGEN_BIN either doesn't exist or isn't executable."
fi

case "$1" in
    start)
        stat_busy "Starting Ocsigen Server"
        sudo -u $OCSIGEN_USER $OCSIGEN_BIN -d

        if [ $? -gt 0 ]; then
            stat_fail
        else
            add_daemon ocsigen
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping Ocsigen Server"
        sudo -u $OCSIGEN_USER bash -c "echo shutdown > $OCSIGEN_PIPE"

        # Don't know the right way to check for clean shutdown yet.
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon ocsigen
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
