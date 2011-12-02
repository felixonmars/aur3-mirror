#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DEKIHOST_CONF="/etc/webapps/mindtouch/mindtouch.host.conf"
DEKIWIKI_USER="http"

if [ ! -f $DEKIHOST_CONF ]; then
    echo "$DEKIHOST_CONF does not exist"
    exit 1
fi

. $DEKIHOST_CONF

# set default values if not specified in $DEKIHOST_CONF

if [ ! -f "$MONO" ]; then
    echo "Please specify the full path to your mono binary"
    exit 1
fi

if [ ! -d "$BIN_DIR" ]; then
    echo "Please specify the path to your MindTouch bin directory"
    exit 1
fi

if [ -z "$APIKEY" ]; then
    echo "Please specify your APIKEY"
    exit 1
fi

if [ -z "$PATH_PREFIX" ]; then
    PATH_PREFIX="@api"
fi

if [ -z "$HTTP_PORT" ]; then
    HTTP_PORT="8081"
fi

if [ -z "$IP" ]; then
    IP="localhost"
fi

if [ -z "$HOST_EXE" ]; then
    HOST_EXE="$BIN_DIR/mindtouch.host.exe"
fi

if [ -z "$SCRIPT" ]; then
    SCRIPT="/etc/dekiwiki/mindtouch.deki.startup.xml"
fi

if [ -z "$NOTTY" ]; then
    NOTTY="notty"
fi

if [ -z "$CONNECT_LIMIT" ]; then
    CONNECT_LIMIT="-5"
fi

if [ -z "$LOGDIR" ]; then
    LOGDIR="/var/www/dekiwiki"
fi

if [ -z "$LOGFILE" ]; then
    LOGFILE="$LOGDIR/deki-api.log"
fi

if [ ! -z "$GUID" ]; then
    GUID="guid $GUID"
fi

if [ ! -z "$STORAGEDIR" ]; then
    STORAGEDIR="storage-dir $STORAGEDIR"
fi

pidof_dekiwiki() {
    # we grep on assembly name and port in case multiple mono processes are running
    echo $(ps -U $DEKIWIKI_USER -o pid,cmd | grep mindtouch.host.exe | grep $HTTP_PORT | awk '{print $1}')
}

stop() {
    PID=$(pidof_dekiwiki)
    stat_busy "Stopping MindTouch API"
    if [ -z "$PID" ]; then
        echo -n "MindTouch is not running."
        stat_fail
        exit 1
    else 
        # attempt to shut down gracefully using curl
        curl -m 10 -s -d "" "http://$IP:$HTTP_PORT/host/?apikey=$APIKEY&dream.in.verb=DELETE"
        sleep 3

        # if the host didn't shut down properly then kill it
        PID=$(pidof_dekiwiki)
        if [ -n "$PID" ]; then
            kill $PID
            sleep 3
            # if it still didn't go away, fail
            PID=$(pidof_dekiwiki)
            if [ -n "$PID" ]; then
              stat_fail
              exit 1
            fi
        fi

        rm -f /var/run/mindtouch.pid
        rm_daemon mindtouch
        stat_done
    fi
}

start() {
    stat_busy "Starting MindTouch API"
    if [ ! -d $LOGDIR ]; then 
        mkdir $LOGDIR
        chown $DEKIWIKI_USER $LOGDIR
    fi
    # see if the process is already running
    PID=$(pidof_dekiwiki)
    if [ -n "$PID" ]; then
        echo -n "MindTouch is already running: $PID"
        stat_fail
        exit 1;
    fi
    MONO_ARGS="$HOST_EXE apikey $APIKEY script $SCRIPT path-prefix $PATH_PREFIX http-port $HTTP_PORT ip $IP connect-limit $CONNECT_LIMIT $NOTTY $GUID $STORAGEDIR"
    su -s /bin/bash -c "exec $MONO $MONO_ARGS " $DEKIWIKI_USER >> $LOGFILE 2>&1 &
    sleep 3

    PID=$(pidof_dekiwiki)
    if [ -z "$PID" ]; then
        stat_fail
        exit 1
    else
        echo "$PID" > /var/run/mindtouch.pid
        add_daemon mindtouch
        stat_done
    fi
}


case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}" >&2
    exit 1
esac

exit 0
