#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Openswan IPsec"
    /etc/rc.d/ipsec-openswan --start
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      add_daemon openswan
    fi
    ;;
  stop)
    stat_busy "Stopping Openswan IPsec"
    /etc/rc.d/ipsec-openswan --stop
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      rm_daemon openswan
    fi
    ;;
  restart)
    stat_busy "Restarting Openswan IPsec"
    /etc/rc.d/ipsec-openswan --restart
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      add_daemon openswan
    fi
    ;;
  status)
    /etc/rc.d/ipsec-openswan --status
    ;;
  *)
    echo "usage: $0 {start|stop|restart|status}"  
esac

