#!/bin/sh

#Starts udev events
/sbin/udevd --daemon &&
/sbin/udevadm trigger
#/sbin/udevadm settle &

/sbin/swapon -a &

#Starting background daemons
. /etc/rc.multi
