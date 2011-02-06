#!/bin/sh -e

### BEGIN INIT INFO
# Provides:             nhsupsclient
# Required-Start:       $local_fs $remote_fs $network
# Required-Stop:        $local_fs $remote_fs $network
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    NHS UPS Client
### END INIT INFO

NHSUPSCLIENT=/usr/local/nhs/nhsupsclient
PIDFILE=/var/lib/nhsups/nhsupsclient.pid

. /etc/rc.conf
. /etc/rc.d/functions

do_start()
{   
    stat_busy "Starting NHS UPS Client Daemon"
    $NHSUPSCLIENT -d
    add_daemon nhsups
    stat_done
}

do_stop()
{
    if [ -e $PIDFILE ]; then
        stat_busy "Stopping NHS UPS Client Daemon"
        rm_daemon nhsups
        kill $(cat $PIDFILE) || rm $PIDFILE
        stat_done
    fi
}

case "$1" in
    start)
        do_start
        ;;
    stop)
        do_stop
        ;;
    restart | reload | force-reload)
        do_stop
        sleep 2
        do_start
        ;;
    status)
        if [ -e $PIDFILE ]; then
            echo "Serviço iniciado.";
        else
            echo "Serviço parado.";
        fi
        ;;
    *)
        echo "Uso: $0 {start|stop|restart|reload|force-reload|status}"
        exit 1
        ;;
esac

exit 0
