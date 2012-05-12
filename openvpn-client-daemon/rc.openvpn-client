#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/openvpn-client

p_etc="/etc/openvpn-client"
p_pid="/var/run/openvpn-client.pid"
p_log="/var/log/openvpn-client.log"

[[ -f $p_pid ]] && PID=$(cat $p_pid)
[[ -d /proc/$PID ]] || PID=""

case "$1" in
  start)
    stat_busy "Starting OpenVPN ... "
    success=0

		/usr/sbin/openvpn --daemon --writepid $p_pid --cd $p_etc --config $NAME --log $p_log $OPENVPN_ARG || success=$?

    if [ $success -eq 0 ]; then
      add_daemon openvpn-client
      stat_done
    else
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping OpenVPN ..."

		kill $PID 2>/dev/null
		rm -f $p_pid

    rm_daemon openvpn-client
    stat_done
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
