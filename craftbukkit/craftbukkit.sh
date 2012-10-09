#!/bin/bash

BACKUPPATH="/srv/craftbukkit/backup/"
WORLDPATH="/srv/craftbukkit/world/"

case "$1" in
  start)
    if [ -z "`pgrep -f -n 'craftbukkit.jar'`" ]; then
      /usr/bin/tmux new-session -d -s craftbukkit-console -d 'cd /srv/craftbukkit; java -Xmx1024M -Xms1024M -jar /srv/craftbukkit/craftbukkit.jar nogui'
      if [ $? -gt 0 ]; then
        exit 1
      fi
    else
      echo "Craftbukkit already started"
      exit 1
    fi
    ;;

  backup)
    FILE="`date +%Y%m%d%H%M`.tar.gz"
    path="$BACKUPPATH/$FILE"
    mkdir -p $BACKUPPATH
    tmux send-keys 'save-off' C-m
    tmux send-keys 'save-all' C-m
    tar -czf $path $WORLDPATH
    tmux send-keys 'save-on' C-m
    ;;

  console)
    tmux attach -t craftbukkit-console
    ;;

  *)
    echo "usage: $0 {start|backup|console} (need to run as 'craftbukkit')"
esac

exit 0

