#!/bin/sh -e

### BEGIN INIT INFO
# Provides:             nhsupsserver
# Required-Start:       $local_fs $remote_fs $network
# Required-Stop:        $local_fs $remote_fs $network
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    NHS UPS Server
### END INIT INFO

NHSUPSSERVER=/usr/local/nhs/nhsupsserver
PIDFILE=/var/lib/nhsups/nhsupsserver.pid

. /etc/rc.conf
. /etc/rc.d/functions

do_start()
{
    stat_busy "Starting NHS UPS Server Daemon"
    $NHSUPSSERVER -d
    add_daemon nhsupsServer
    stat_done
}

do_stop()
{
    if [ -e $PIDFILE ]; then
        stat_busy "Stopping NHS UPS Server Daemon"
        rm_daemon nhsupsServer
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
