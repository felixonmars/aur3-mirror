#!/bin/sh
#
# Battery monitor
#
# Blink ThinkPad Power LED if battery capacity falls below $warncapacity percent
# -- Must run as root...
#
warncapacity=7

# check battery level every $checkevery seconds
checkevery=10

while true
do

    parts=$(acpi -b)

    if [ "$(cut -d, -f1 <<<$parts)" = "Battery 0: Discharging" ]
    then
	    capacity=$(cut -d, -f2 <<<$parts|sed 's/[^0-9]//g')
	    if [ $capacity -lt $warncapacity ]
	    then
		    echo 0 blink >/proc/acpi/ibm/led
	    else 
		    echo 0 on >/proc/acpi/ibm/led
	    fi
    else
	    echo 0 on > /proc/acpi/ibm/led
    fi
    sleep $checkevery
done
