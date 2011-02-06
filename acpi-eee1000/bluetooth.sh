#!/bin/sh

source /etc/acpi/eee.conf

if [ "X$BLUETOOTH_SWITCH" = "X" ]
then
    logger "Missing parameter BLUETOOTH_SWITCH in /etc/acpi/eee.conf."
    exit 1
fi

if [ ! -e $BLUETOOTH_SWITCH ]
then
    logger "'$BLUETOOTH_SWITCH' not found.  Does your acpi module contain the bluetooth patch?"
    exit 1
fi

# Get the current Bluetooth value
BT=$(cat $BLUETOOTH_SWITCH)

if [ "X$BT" == "X1" ]
then
    # Turn bluetooth off
    echo 0 > $BLUETOOTH_SWITCH
elif [ "X$BT" == "X0" ]
then
    # Turn bluetooth on
    echo 1 > $BLUETOOTH_SWITCH
else
    logger "Invalid value in $BLUETOOTH_SWITCH:  '$BT'"
    exit 1
fi

exit 0
