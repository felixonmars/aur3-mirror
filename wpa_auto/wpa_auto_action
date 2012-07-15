#!/bin/bash

if [[ -f /etc/conf.d/wpa_auto ]]; then
    . /etc/conf.d/wpa_auto
else
    exit 1
fi

if [[ $2 = "CONNECTED" ]]; then
    [[ -f /run/dhcpcd-$1.pid ]] && /sbin/dhcpcd -qx $1
    /sbin/dhcpcd -q $DHCPCD_OPTIONS $1
elif [[ $2 = "DISCONNECTED" ]]; then
    /sbin/dhcpcd -qx $1
fi

exit 0

