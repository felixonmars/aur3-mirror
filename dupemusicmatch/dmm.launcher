#!/bin/bash

unset GUI
for param in "$@"; do
  [[ $param = '-gui' ]] && GUI=-GTK
done

cd /usr/share/dupemusicmatch
exec python2 ./DupeMusicMatch$GUI.py "$@"
