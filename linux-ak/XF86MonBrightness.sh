#!/bin/sh -e
if [[ "$1" = "-h" ]]
then
    echo "Use: $(basename $0) [+/-pcnt]"
    exit 0
fi
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
cur=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
if ( echo $1 | egrep "^[-+]{0,1}[0-9]{1,3}$" > /dev/null )
then 
    change=$1
else
    echo $(($cur *100 / $max ))%
    exit 0
fi
new=$(( $cur + $change * $max / 100))
[[ $new -gt $max ]]	&& new=$max
[[ $new -lt    0 ]]	&& new=0
echo $new > /sys/class/backlight/intel_backlight/brightness
notify-send -u low -h int:value:$(($new *100 / $max )) "Brightness"
