#!/bin/bash

case "$1" in
  start)
    echo "Starting URemoteDesktop server"
    cd /opt/uremotedesktop
    nohup java -classpath /opt/uremotedesktop ControllerD &
    ;;
  stop)
    echo "Stopping URemoteDesktop server"
    ps ax | awk '/ControllerD/ {print $1}' | xargs kill
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
