#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting bitcoind"
    su -s /bin/bash -c "nohup bitcoind -gen=0 -datadir=/var/lib/bitcoin-daemon &" bitcoin > /dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon bitcoind
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping bitcoind"
    su -s /bin/bash -c "bitcoind -datadir=/var/lib/bitcoin-daemon stop" bitcoin &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon bitcoind
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
esac
exit 0
