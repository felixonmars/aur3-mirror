#!/bin/bash

BACKUPPATH="/srv/agrarianskies2/backup/"
WORLDPATH="/srv/agrarianskies2/world/"

USER="$2"

if [ -z $2 ]; then
        USER="agrarianskies2"
fi

save_stop() {
    su -s /bin/bash -c "tmux send-keys 'save-off' C-m" ${USER}
    su -s /bin/bash -c "tmux send-keys 'save-all' C-m" ${USER}
}

save_start() {
    su -s /bin/bash -c "tmux send-keys 'save-on' C-m" ${USER}
}

case "$1" in
  start)
    if [ -z "`pgrep -f -n 'agrarianskies2.jar'`" ]; then
      sudo -u ${USER} tmux new-session -d -s agrarianskies2-console -d 'cd /srv/agrarianskies2; java -Xmx2048M -Xms2048M -jar /srv/agrarianskies2/agrarianskies2.jar nogui'
      if [ $? -gt 0 ]; then
        exit 1
      fi
    else
      echo "Agrarian Skies already started"
      exit 1
    fi
    ;;

  stop)
    sudo -u ${USER} tmux send-keys -t agrarianskies2-console 'broadcast NOTICE: Server shutting down in 5 seconds!' C-m
    sleep 5
    sudo -u ${USER} tmux send-keys -t agrarianskies2-console 'stop' C-m
    sleep 10
    ;;

  console)
    sudo -u ${USER} tmux attach -t agrarianskies2-console
    ;;
  
  backup)
    echo "Starting backup"
    FILE="`date +%Y%m%d%H%M`.tar.gz"
    path="$BACKUPPATH/$FILE"
    su -s /bin/bash -c "mkdir -p $BACKUPPATH" ${USER}
    save_stop
    su -s /bin/bash -c "tar -czf $path $WORLDPATH" ${USER}
    save_start
    echo "Backup finished"
    ;;

  *)
    echo "usage: $0 {start|backup|console|stop} user"
esac

exit 0

