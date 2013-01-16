#!/bin/bash

TMUX_CONSOLE=tshock-console

USER=$2
if [ -z $2 ]; then
        USER=tshock
fi

case "$1" in
  start)
    if [ -z "`pgrep -f -n 'TerrariaServer.exe'`" ]; then
      sudo -u ${USER} tmux new-session -d -s ${TMUX_CONSOLE} -d 'cd /srv/tshock/; mono TerrariaServer.exe -port 7777 -world /srv/tshock/Terraria/Worlds/world1.wld'
      if [ $? -gt 0 ]; then
        exit 1
      fi
    else
      echo "Tshock already started"
      exit 1
    fi
    ;;

  stop)
    sudo -u ${USER} tmux send-keys -t ${TMUX_CONSOLE} 'broadcast NOTICE: Server shutting down in 5 seconds!' C-m
    sleep 5
    sudo -u ${USER} tmux send-keys -t ${TMUX_CONSOLE} 'exit' C-m
    sleep 10
    ;;

  console)
    sudo -u ${USER} tmux attach -t ${TMUX_CONSOLE}
    ;;

  install)
    sudo -u ${USER} bash -c 'cd /srv/tshock/; mono TerrariaServer.exe'
    ;;

  *)
    echo "usage: $0 {start|backup|console|install} user"
esac

exit 0

