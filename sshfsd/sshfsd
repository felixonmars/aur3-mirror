#!/bin/bash

daemon_name=sshfsd

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$daemon_name.conf

get_pid() {
  pidof -o %PPID $daemon_name
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    PID=$(get_pid)

    if [[ -z $PID ]]; then
      [[ -f /var/run/$daemon_name.pid ]] &&
        rm -f /var/run/$daemon_name.pid

      for SSHFS_PATH in ${SSHFS_PATHS[@]};do
        LOCAL_PATH=${SSHFS_PATH#*::}
        REMOTE_PATH=${SSHFS_PATH%::*}
        [ -d $LOCAL_PATH ] || ( su -c "mkdir -p $LOCAL_PATH" $SSHFS_OWNER || exit 2 )
        su -c "sshfs -o $SSHFS_OPTIONS $SSHFS_USER@$SSHFS_HOST:$REMOTE_PATH $LOCAL_PATH &" $SSHFS_OWNER
      done

      if [[ $? -gt 0 ]]; then
        stat_fail
        exit 1
      else
        echo $(get_pid) > /var/run/$daemon_name.pid
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"

    PID=$(get_pid)

    if [[ -n $PID ]];then
      for pid in $PID;do
        kill $pid &> /dev/null
      done
    fi

    if [[ $? -gt 0 ]]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/$daemon_name.pid &> /dev/null
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 3
    $0 start
    ;;

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0

# vim:set ts=2 sw=2 et:
