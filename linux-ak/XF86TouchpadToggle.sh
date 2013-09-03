#!/bin/sh -e
code=$(synclient|grep TouchpadOff|tr -d '[:blank:]'|cut -d= -f2)
case $code in
    1)
        pkill -CONT syndaemon
        synclient TouchpadOff=0
        notify-send -u low "Touchpad" "On"
        ;;
    0|2)
        pkill -STOP syndaemon
        synclient TouchpadOff=1
        notify-send -u low "Touchpad" "Off"
        ;;
esac
