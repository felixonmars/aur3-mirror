#!/bin/sh -e
if [[ "$1" = "-h" ]]
then
    echo Use: $(basename $0) up/down
    exit 0
fi
file="/sys/class/leds/asus::kbd_backlight/brightness"
max=$(cat /sys/class/leds/asus::kbd_backlight/max_brightness)
cur=$(cat $file)
new=0
case $1 in
    up)
        new=$(($cur + 1))
        [[ $new -gt $max ]] && new=$max
        echo $new > $file
        ;;
    down)
        new=$(($cur - 1))
        [[ $new -le 0 ]] && new=0
        echo $new > $file
        ;;
esac
notify-send -u low -h int:value:$((33 * $new)) "Kbd Brightness"
