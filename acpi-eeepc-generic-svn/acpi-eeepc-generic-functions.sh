#!/bin/bash

CONSOLE_NUMBER=$(fgconsole)

# Get username
if [ -S /tmp/.X11-unix/X0 ]; then
    export DISPLAY=:0
    user=$(who | sed -n '/ (:0[\.0]*)$\| :0 /{s/ .*//p;q}')
    # If autodetection fails, fallback to default user
    # set in /etc/conf.d/acpi-eeepc-generic.conf
    [ "x$user" == "x" ] && user=$XUSER
    home=$(getent passwd $user | cut -d: -f6)
    XAUTHORITY=$home/.Xauthority
    if [[ -f $XAUTHORITY ]]; then
        export XAUTHORITY
    fi
fi

function eeepc_notify {
    /bin/su $XUSER --login -c "/usr/bin/notify-send -i $2 -t 1500 \"EeePC $EEEPC_MODEL\" \"$1\""
    #/usr/bin/notify-send -i $2 -t 1500 "EeePC $EEEPC_MODEL" "$1"
    logger "EeePC $EEEPC_MODEL: $1 ($2)"
}

function execute_commands() {
    cmds=( "$@" )
    cmds_num=${#cmds[@]}
    logger "execute_commands = $cmds ($cmds_num)"
    for ((i=0;i<${cmds_num};i++)); do
        c=${cmds[${i}]}
        logger "execute_commands #$i: $c"
        echo "execute_commands #$i: $c"
        ${c} &
    done
}
function execute_commands_as_user() {
    cmds=( "$@" )
    cmds_num=${#cmds[@]}
    logger "execute_commands_as_user = $cmds ($cmds_num)"
    for ((i=0;i<${cmds_num};i++)); do
        c=${cmds[${i}]}
        logger "execute_commands_as_user #$i: $c"
        echo "execute_commands_as_user #$i: $c"
        su $XUSER --login -c "${c} &"
    done
}

function volume_is_mute() {
    # 0 is true, 1 is false
    on_off=`amixer get iSpeaker | grep -A 1 -e Mono | grep Playback | awk '{print ""$4""}'`
    is_muted=1
    [ "$on_off" == "[off]" ] && is_muted=0
    return $is_muted
}

function get_volume() {
    echo `amixer get PCM | grep -A 1 -e Mono | grep Playback | awk '{print ""$5""}' | sed -e "s|\[||g" -e "s|]||g" -e "s|\%||g"`
}

function get_model() {
    (grep EEEPC_MODEL /etc/conf.d/acpi-eeepc-generic.conf >/dev/null 2>&1) || echo "EEEPC_MODEL=$(dmidecode -s system-product-name)" >> /etc/conf.d/acpi-eeepc-generic.conf
    (grep EEEPC_CPU /etc/conf.d/acpi-eeepc-generic.conf >/dev/null 2>&1) || echo "EEEPC_CPU=`((grep Celeron /proc/cpuinfo >/dev/null 2>&1) && echo Celeron) || echo Atom`" >> /etc/conf.d/acpi-eeepc-generic.conf
}

function brightness_get_percentage() {
    actual_brightness=`cat /sys/class/backlight/eeepc/actual_brightness`
    maximum_brightness=`cat /sys/class/backlight/eeepc/max_brightness`
    echo $((10000*$actual_brightness / (100*$maximum_brightness) ))
}

function brightness_find_direction() {
    actual_brightness=`cat /sys/class/backlight/eeepc/actual_brightness`
    previous_brightness=`cat /var/eeepc/brightness_saved`
    [ "x$previous_brightness" == "x" ] && previous_brightness=$actual_brightness
    to_return="up"
    [ $actual_brightness -lt $previous_brightness ] && to_return="down"
    echo $actual_brightness > /var/eeepc/brightness_saved
    echo $to_return
}


