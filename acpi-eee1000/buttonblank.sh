#!/bin/bash

source /etc/acpi/eee.conf
source /etc/acpi/eee/user && x_user_func

if [ -n "`/usr/bin/xset -display :0.0 -q | grep -e '  Monitor is Off'`" ]
then 
    xset -display :0.0 dpms force on || exit 1
else
    xset -display :0.0 dpms force off || exit 1
fi

exit 0
