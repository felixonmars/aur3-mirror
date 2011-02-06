#!/bin/bash

. /usr/lib/pm-utils/functions

case "$1" in
hibernate|suspend)
if [ -d "/sys/power/tuxonice" ]; then
suspend2ui="/sys/power/tuxonice/user_interface/program"
else
suspend2ui="/proc/suspend2/userui_program"
fi
if [ -e "${suspend2ui}" ]; then
names="text"
[ -d /etc/splash/tuxonice ] && names="fbsplash text"
for n in ${names} ; do
p="/usr/sbin/tuxoniceui_${n}"
if [ -x "${p}" ]; then
echo "${p}" > "${suspend2ui}"
break
fi
done
else
exit $NA
fi
;;
*)
exit $NA
;;
esac

exit $?
