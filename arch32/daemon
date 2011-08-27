#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case $1 in
    start)
        stat_busy "Starting Arch32 Chroot"
        mount --bind /proc /opt/arch32/proc
        mount --bind /proc/bus/usb /opt/arch32/proc/bus/usb
        mount --bind /dev /opt/arch32/dev
        mount --bind /dev/pts /opt/arch32/dev/pts
        mount --bind /dev/shm /opt/arch32/dev/shm
        mount --bind /sys /opt/arch32/sys
        mount --bind /tmp /opt/arch32/tmp
        mount --bind /home /opt/arch32/home
        add_daemon arch32
        stat_done
        ;;
    stop)
        stat_busy "Stopping Arch32 Chroot"
        umount /opt/arch32/proc/bus/usb
        umount /opt/arch32/proc
        umount /opt/arch32/dev/pts
        umount /opt/arch32/dev/shm
        umount /opt/arch32/dev
        umount /opt/arch32/sys
        umount /opt/arch32/tmp
        umount /opt/arch32/home
        rm_daemon arch32
        stat_done
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

