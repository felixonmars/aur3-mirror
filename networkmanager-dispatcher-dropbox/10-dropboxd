#!/bin/bash

case "$2" in
  up) # $INTERFACE is up
    #USERS=$(ps -o user --no-headers -C dropbox)
    #killall dropbox
    #for user in $USERS; do
    #    su -c "DISPLAY=$(who | sed -e "/$user/! d;/pts/d;s/^.*[^0-9]\\(:[0-9.]\\+\\).*$/\\1/p;d" | head -n1) dropboxd &" $user
    #done

    USERS=$(w | awk '/\/X/ {print $1}')

    for user in $USERS; do
      su -c "DISPLAY=$(w | awk '/\/X/ {print $11}') dropboxd &" $user
    done  
  ;;
  down) # $INTERFACE is down
    killall dropbox
  ;;
esac
