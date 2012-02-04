#!/bin/sh
. "${PM_FUNCTIONS}"

case $1 in
        hibernate|suspend)
                echo 1 > /sys/devices/platform/dock.0/undock
                ;;

        thaw|resume)
                # should dock automatically
                ;;

        *) exit $NA
                ;;
esac
