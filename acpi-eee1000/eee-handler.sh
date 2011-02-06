#!/bin/sh

source /etc/acpi/eee.conf
source /etc/acpi/eee/user && x_user_func

case "$1" in
	button/power)
		case "$2" in
			PWRF)	$POWER_BUTTON_COMMAND &
			;;
			*)	logger "ACPI power undefined: $2 $3 $4"
			;;
		esac
		;;

	button/sleep)
		case "$2" in
			SLPB) /etc/acpi/eee/suspend2ram.sh
			;;
			*)	logger "ACPI sleep undefined: $2 $3 $4"
			;;
		esac
		;;

	ac_adapter)
		case "$2" in
			AC0)
				case "$4" in
					00000000) # AC off
					    echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
            				    $AC_UNPLUGGED_COMMAND &
            				    #echo $BRIGHTNESS_BATTERY > /proc/acpi/asus/brn
            				    xbacklight -set $BRIGHTNESS_BATTERY
            				    if [ $WIRELESS_MODULE = "iwl3945" ]; then
            					echo $WIRELESS_POWERSAVE > /sys/bus/pci/drivers/iwl3945/0000:01:00.0/power_level;
            				    fi
					;;
					00000001) # AC on
					    #echo 500 > /proc/sys/vm/dirty_writeback_centisecs
            				    $AC_PLUGGED_COMMAND &
            				    #echo $BRIGHTNESS_AC > /proc/acpi/asus/brn
            				    xbacklight -set $BRIGHTNESS_AC
            				    if [ $WIRELESS_MODULE = "iwl3945" ]; then
            				        echo 6 > /sys/bus/pci/drivers/iwl3945/0000:01:00.0/power_level;
            				    fi
					;;
				esac
				;;
			*) logger "ACPI AC undefined: $2 $3 $4"
			;;
		esac
		;;

	battery)
		case "$2" in
			BAT0)
				case "$4" in
					00000000) # Battery removed
					;;
					00000001) # Battery present
					;;
				esac
				;;
			*) logger "ACPI battery undefined: $2 $3 $4"
			;;
		esac
		;;

	button/lid)
        lidstate=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
	    case "$lidstate" in
		open)
		    # screen on
		    xset dpms force on
		;;
		closed)
		    if [ "$COMMAND_ON_LID_CLOSE" == "yes" ]; then
                ac_state=$(cat /proc/acpi/ac_adapter/AC0/state | awk '{print $2}' )
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
                if [ -z "$ON_AC_LID_CLOSE_ACTION" ] && [ -z "$ON_BATTERY_LID_CLOSE_ACTION" ] && [ -n "$SUSPEND_SCRIPT" ]; then
                    ($SUSPEND_SCRIPT &)
                fi
		    fi
		;;
		*)
		    logger "Lid state undefined: $2 $3 $4"
		;;
	    esac
	    ;;
	hotkey)
		case "$3" in
            0000001a) #
                logger "eee-handler.sh (hotkey): Silver function buttons (Blank)"
                $BUTTON_BLANK
            ;;
            0000001b) #
                logger "eee-handler.sh (hotkey): Silver function buttons (Resolution)"
                $BUTTON_RESOLUTION
            ;;
            0000001c) #
                logger "eee-handler.sh (hotkey): Silver function buttons (User1)"
                su $user --login -c "$BUTTON_USER1" &
            ;;
            0000001d) #
                logger "eee-handler.sh (hotkey): Silver function buttons (User2)"
                su $user --login -c "$BUTTON_USER2" &
            ;;

            0000002*) # Fn-F{5,6} (Brightness Up/Down)
                logger "eee-handler.sh (hotkey): Fn-F{5,6} (Brightness Up/Down)"
            ;;
            00000011) # Fn-F2 (WiFi)
                logger "eee-handler.sh (hotkey): Fn-F2 (WiFi)"
                /etc/acpi/eee/wlan.sh
            ;;
            00000016) # Fn-F7 (???)
                logger "eee-handler.sh (hotkey): Fn-F7 (???)"
            ;;
            00000030) # Fn-F8 (RandR)
                logger "eee-handler.sh (hotkey): Fn-F8 (RandR 30)"
                $BOTH_DISPLAY_COMMAND &
            ;;
            00000031) # Fn-F8 (RandR)
                logger "eee-handler.sh (hotkey): Fn-F8 (RandR 31)"
                $PRE_VGA_EXTRA_COMMAND &
                xrandr --output LVDS --off --output VGA --preferred
                $POST_VGA_EXTRA_COMMAND &
            ;;
            00000032) # Fn-F8 (RandR)
                logger "eee-handler.sh (hotkey): Fn-F8 (RandR 32)"
                $PRE_LVDS_EXTRA_COMMAND &
                xrandr --output LVDS --preferred --output VGA --off
                $POST_LVDS_EXTRA_COMMAND &
            ;;
            00000012) # Fn-F9 (Task Manager)
                logger "eee-handler.sh (hotkey): Fn-F9 (Task Manager)"
                su $user --login -c "$AP_COMMAND" &
            ;;
            00000013) # Fn-F10 (Mute)
                logger "eee-handler.sh (hotkey): Fn-F10 (Mute)"
                # Control by asusosd
#                 amixer set LineOut toggle
#                 amixer set iSpeaker toggle
            ;;
            00000014) # Fn-F11 (Volume Down)
                logger "eee-handler.sh (hotkey): Fn-F11 (Volume Down)"
                amixer set PCM 4%-
            ;;
            00000015) # Fn-F12 (Volume Up)
                logger "eee-handler.sh (hotkey): Fn-F12 (Volume Up)"
                amixer set PCM 4%+
            ;;
# 		    00000052) # battery level critical
# 			logger "Battery is critical, suspending"
# 			$BATTERY_CRITICAL &
# 		    ;;
		    *) logger "ACPI hotkey undefined: $2 $3 $4"
		    ;;
		esac
		;;

	*)
		logger "ACPI group/action undefined: $1 $2 $3 $4"
		;;
esac
