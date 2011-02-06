#!/bin/bash
#hotkey ATKD 00000051 00000007
source /etc/acpi/eee.conf

# If we get command line parameters, use acpi-stuff else do check up
if [ -n "$3" ];then
	case $3 in
		00000051) #AC unplugged
			$AC_UNPLUGGED_COMMAND &	
		;;
		00000050) #On AC
			$AC_PLUGGED_COMMAND &
		;;
		*)
			echo "Unknown ACPI state..."
		;;
	esac
else
	ac_state=$(cat /proc/acpi/ac_adapter/AC0/state | awk '{print $2}' )
        case $ac_state in
                off-line) #AC unplugged
                	echo "AC is unplugged."
                        ( sleep 1; $AC_UNPLUGGED_COMMAND & ) &
                ;;
                on-line) #On AC
                	echo "AC is plugged in."
                        (sleep 1; $AC_PLUGGED_COMMAND & ) &
                ;;
        esac
fi
exit 0
