#!/bin/sh
if [ -e "/etc/acpi/power.lock" ]; then
	exit 0
fi

if grep -q mem /sys/power/state ; then

	# BEGIN SUSPEND SEQUENCE	
	# save the brightness value
	BRN=$(cat /sys/class/backlight/eeepc/actual_brightness)
	
	# set the fsb to its normal speed
	# eeeclockmod upclock

	# flush the buffers to disk
	sync

	# change virtual terminal to not screw up X
	chvt 6

	# put us into suspend state
	echo -n "mem" > /sys/power/state

        # BEGIN WAKEUP SEQUENCE
         
	#Ugly but effective way to restore screen
	/usr/sbin/vbetool post
	chvt 7 #Back to X

	# restore backlight BRN
	sleep 1
        echo $BRN > /sys/class/backlight/eeepc/brightness
	
	# choose right fsb, lcd backlight, devices power state accordingly to power source 
	#/usr/local/bin/eeeautoclock.sh &
fi

exit 0