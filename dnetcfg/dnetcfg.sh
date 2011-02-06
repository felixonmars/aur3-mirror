#!/bin/sh

PROFILE=`ls -l /etc/network.d | grep ^- | awk '{print $9}' | dmenu -p 'Select a network profile:' $*`
if [ "empty$PROFILE" != "empty" ]; then
    sudo netcfg -a
    sudo netcfg $PROFILE
fi
