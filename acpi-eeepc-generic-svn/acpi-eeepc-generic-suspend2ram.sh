#!/bin/sh

source /etc/conf.d/acpi-eeepc-generic.conf
source /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

function suspend_check_blacklisted_processes() {
    processes=( "$@" )
    p_num=${#processes[@]}
    logger "Checking for processes before suspending: $processes ($p_num)"
    for ((i=0;i<${p_num};i++)); do
        p=${processes[${i}]}
        pid=`pidof $p`
        logger "process #$i: $p ($pid)"
        echo "process #$i: $p ($pid)"
        [ "x$pid" != "x" ] &&
            echo "$p is running! Canceling suspend" &&
            logger "$p is running! Canceling suspend" &&
            exit 0
    done
}

suspend_check_blacklisted_processes "${SUSPEND_BLACKLISTED_PROCESSES[@]}"

if [ -e "${EEEPC_VAR}/power.lock" ]; then
    logger "${EEEPC_VAR}/power.lock exist, canceling suspend"
	exit 0
fi

vga_is_on=`xrandr | grep -A 1 VGA | grep "*"`
if [ "x$vga_is_on" != "x" ]; then
    logger "VGA is up and running, canceling suspend"
    exit 0
fi

if grep -q mem /sys/power/state ; then

	# BEGIN SUSPEND SEQUENCE

	logger "Start suspend sequence"

	# get console number
	CONSOLE_NUMBER=$(fgconsole)
	logger "Saving console number: $CONSOLE_NUMBER"

 	# save the brightness value
 	BRN=`cat /sys/class/backlight/eeepc/actual_brightness`
 	logger "Saving brightness value: $BRN"

	# save the FSB value and go to powersaver mode
# 	/etc/acpi/eee/fsb.sh autosuspend
    logger "Save the FSB value and go to powersaver mode: DISABLE"

	#
	LOADEEE="no"
	EEESTATE=$(lsmod | grep eee | awk {'print $1'})
	if [ "X$EEESTATE" == "Xeee" ];
	    then
	    modprobe -r eee
	    LOADEEE="yes"
	    logger "Unloading eee module";
	fi

	# flush the buffers to disk
	sync

	# change virtual terminal to not screw up X
	chvt 1

	# put us into suspend state
	echo -n "mem" > /sys/power/state

    logger "BEGIN WAKEUP SEQUENCE..."

	#Ugly but effective way to restore screen
	#/usr/sbin/vbetool post
	chvt $CONSOLE_NUMBER

	# restore backlight BRN
 	sleep 1
    echo $BRN > /sys/class/backlight/eeepc/brightness
    logger "Restoring brightness"

#	# restore the FSB value
# 	/etc/acpi/eee/fsb.sh autoresume

fi

exit 0

