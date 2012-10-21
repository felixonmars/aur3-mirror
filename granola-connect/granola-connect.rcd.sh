#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_name=granola-connect
. /etc/conf.d/$daemon_name.conf

PID=$(get_pid $daemon_name)

case "$1" in
    start)
        stat_busy "Starting $daemon_name"
        if [[ -z "$PID" ]]; then
            # make sure the granola daemon is running first
            granolaPID=$(get_pid granola)
            if [[ ! -z "$granolaPID" ]]; then
                $gc_dir/$daemon_name $granolaconnect_args
                if [[ $? == 0 ]]; then
                    echo $(get_pid $daemon_name) > /run/$daemon_name.pid
                    add_daemon $daemon_name
                    stat_done
                else
                    stat_fail
                    exit 1
                fi
            else
                stat_fail
                exit 1
            fi
        fi
        ;;

    stop)
        stat_busy "Stopping $daemon_name"
        [[ ! -z "$PID" ]] && kill $PID &> /dev/null
        if [[ $? == 0 ]]; then
            rm -f /run/$daemon_name.pid &> /dev/null
            rm_daemon $daemon_name
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;

    restart)
        $0 stop
        sleep 1
        $0 start
        ;;

    status)
        stat_busy "Checking $daemon_name status"
        ck_status $daemon_name
        ;;

    *)
        echo "usage: $0 {start|stop|restart|status}"
esac
