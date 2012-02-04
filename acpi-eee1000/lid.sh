#!/bin/sh
# This script handles all lid events

source /etc/acpi/eee.conf
source /etc/acpi/eee/user && x_user_func

lidstate=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}' )
ac_state=$(cat /proc/acpi/ac_adapter/AC0/state | awk '{print $2}' )
logger Lid state: $lidstate
logger AC state: $ac_state
case $lidstate in
	open)
		# screen on
		xset dpms force on
	;;
	closed)
		# screen off
		xset dpms force off 
		if [ "$COMMAND_ON_LID_CLOSE" == "yes" ];
		then 
			case $ac_state in
			on-line)
				# AC adapter plugged in
				($ON_AC_LID_CLOSE_ACTION &)
			;;
			off-line)
				# Battery powered
				($ON_BATTERY_LID_CLOSE_ACTION &)
			;;
			esac

			# if both AC/BATTERY-variables are unset and SUSPEND_SCRIPT is set: execute SUSPEND_SCRIPT
			# This is for backward compatibility.
			if [ -z "$ON_AC_LID_CLOSE_ACTION" ] && [ -z "$ON_BATTERY_LID_CLOSE_ACTION" ] && [ -n "$SUSPEND_SCRIPT" ];
			then
				($SUSPEND_SCRIPT &)
			fi
		fi
	;;
	*)
		logger "Unknown lid state"
	;;
esac

exit 0
