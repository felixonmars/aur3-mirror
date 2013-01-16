#!/bin/bash

BACKUPPATH="/srv/craftbukkit/backup/"
WORLDPATH="/srv/craftbukkit/world/"

USER="$2"

if [ -z $2 ]; then
        USER="craftbukkit"
fi

case "$1" in
  start)
    if [ -z "`pgrep -f -n 'craftbukkit.jar'`" ]; then
      sudo -u ${USER} tmux new-session -d -s craftbukkit-console -d 'cd /srv/craftbukkit; java -Xmx1024M -Xms1024M -jar /srv/craftbukkit/craftbukkit.jar nogui'
      if [ $? -gt 0 ]; then
        exit 1
      fi
    else
      echo "Craftbukkit already started"
      exit 1
    fi
    ;;

  stop)
    sudo -u ${USER} tmux send-keys -t craftbukkit-console 'broadcast NOTICE: Server shutting down in 5 seconds!' C-m
    sleep 5
    sudo -u ${USER} tmux send-keys -t craftbukkit-console 'stop' C-m
    sleep 10
    ;;

  console)
    sudo -u ${USER} tmux attach -t craftbukkit-console
    ;;

  *)
    echo "usage: $0 {start|backup|console} user"
esac

exit 0

