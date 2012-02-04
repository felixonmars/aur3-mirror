#!/bin/sh
if [ -e "/etc/acpi/power.lock" ]; then
	exit 0
fi

if grep -q mem /sys/power/state ; then

	# BEGIN SUSPEND SEQUENCE	
	# save the brightness value
	BRN=$(cat /proc/acpi/asus/brn)

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
        echo $BRN > /proc/acpi/asus/brn

	# execute powersource.sh so we have the right settings after suspend
	(sleep 1; /etc/acpi/powersource.sh &) &
fi

exit 0
