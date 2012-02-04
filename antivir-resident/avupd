#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

NOUPDATER=$(/usr/lib/AntiVir/avupdater status | grep 'not')
C_RUNNING="\033[1;32;40m"

case "$1" in
  start)
    stat_busy "Starting AntiVir Updater"
    [ -n "$NOUPDATER" ] && /usr/lib/AntiVir/avupdater start &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon avupd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping AntiVir Updater"
    [ -z "$NOUPDATER" ] && /usr/lib/AntiVir/avupdater stop &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon avupd
      stat_done
    fi
    ;;
  status)
    printf "${C_OTHER}:: ${C_MAIN}Probing AntiVir Updater... "
    [ -z "$NOUPDATER" ] && printf "${C_RUNNING}" || printf "${C_FAIL}not "
    printf "running${C_CLEAR}"
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|status|restart}"
esac
exit 0
