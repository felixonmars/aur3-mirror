#!/bin/bash


PID=`pidof -o %PPID /usr/local/bin/mpd-notify`
case "$1" in
  start)
    echo "Iniciando mpd-notify"
    [ -z "$PID" ] && /usr/local/bin/mpd-notify &
    if [ $? -gt 0 ]; then
      echo "FAIL"
    else
      echo $PID > $HOME/.mpd-notify.pid
      echo "OK"
    fi
    ;;
  stop)
    stat_busy "Deteniendo mpd-notify"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
     	echo "FAIL"
    else
      rm $HOME/.mpd-notify.pid
     echo "OK"
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "Uso: $0 {start|stop|restart}"  
esac
