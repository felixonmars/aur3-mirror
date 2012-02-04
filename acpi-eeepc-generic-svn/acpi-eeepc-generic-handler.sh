#!/bin/sh


source /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh
source /etc/conf.d/acpi-eeepc-generic.conf
get_model
source /etc/acpi/eeepc/models/acpi-eeepc-$EEEPC_MODEL-events.conf

# Needed, else libnotify can't display its magic
su $XUSER --login -c "xhost +"

SELECTION=$3
if [ "$KEY_SHOW" = "1" ]; then
  eeepc_notify "You pressed: \"$SELECTION\"" keyboard
fi

case "$1" in
    test)
        cmds=(test1 test2 "test3 test4")
        eeepc_notify "Test event: ${cmds[@]}" keyboard
        execute_commands "${cmds[@]}"
    ;;
	button/power)
		case "$2" in
			PWRF)
			    eeepc_notify "Power button pressed"
			    execute_commands "${COMMANDS_POWER_BUTTON[@]}"
			;;
			*)
			    eeepc_notify "Button undefined: $2 $3 $4"
			    logger "ACPI power undefined: $2 $3 $4"
			;;
		esac
		;;

	button/sleep)
		case "$2" in
			SLPB)
			    eeepc_notify "Sleep button pressed"
			    execute_commands "${COMMANDS_SLEEP[@]}"
			;;
			*)
			    eeepc_notify "Button undefined: $2 $3 $4"
			    logger "ACPI sleep undefined: $2 $3 $4"
			;;
		esac
		;;

	ac_adapter)
		case "$2" in
			AC0)
				case "$4" in
					$POWER_BAT) # AC off
					    #echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
                        execute_commands "${COMMANDS_AC_UNPLUGGED[@]}"
            			#echo $BRIGHTNESS_BATTERY > /proc/acpi/asus/brn
            			#xbacklight -set $BRIGHTNESS_BATTERY
            			#if [ $WIRELESS_MODULE = "iwl3945" ]; then
            			#echo $WIRELESS_POWERSAVE > /sys/bus/pci/drivers/iwl3945/0000:01:00.0/power_level;
            			#fi
					;;
					$POWER_AC) # AC on
					    #echo 500 > /proc/sys/vm/dirty_writeback_centisecs
            			execute_commands "${COMMANDS_AC_PLUGGED[@]}"
            			#echo $BRIGHTNESS_AC > /proc/acpi/asus/brn
            			#xbacklight -set $BRIGHTNESS_AC
            			#if [ $WIRELESS_MODULE = "iwl3945" ]; then
            			#    echo 6 > /sys/bus/pci/drivers/iwl3945/0000:01:00.0/power_level;
            			#fi
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
		    if [ "$COMMANDS_ON_LID_CLOSE" == "yes" ]; then
                ac_state=$(cat /proc/acpi/ac_adapter/AC0/state | awk '{print $2}' )
                case $ac_state in
                on-line)
                    # AC adapter plugged in
                    execute_commands "${COMMANDS_LID_CLOSE_ON_AC[@]}"
                ;;
                off-line)
                    # Battery powered
                    execute_commands "${COMMANDS_LID_CLOSE_ON_BATTERY[@]}"
                ;;
                esac
		    fi
		;;
		*)
		    logger "Lid state undefined: $2 $3 $4"
		;;
	    esac
	    ;;
	hotkey)
		case "$3" in
            $EEEPC_BLANK) # Silver function button 1 (Blank)
                logger "acpi-eeepc-generic-handler.sh (hotkey): Silver function button (Blank)"
                execute_commands "${COMMANDS_BUTTON_BLANK[@]}"
            ;;
            $EEEPC_RESOLUTION) # Silver function button 2 (Resolution)
                logger "acpi-eeepc-generic-handler.sh (hotkey): Silver function button (Resolution)"
                execute_commands "${COMMANDS_BUTTON_RESOLUTION[@]}"
            ;;
            $EEEPC_USER1) # Silver function button 3 (User1)
                logger "acpi-eeepc-generic-handler.sh (hotkey): Silver function button (User1)"
                execute_commands_as_user "${COMMANDS_BUTTON_USER1[@]}"
            ;;
            $EEEPC_USER2) # Silver function button 4 (User2)
                logger "acpi-eeepc-generic-handler.sh (hotkey): Silver function button (User2)"
                execute_commands_as_user "${COMMANDS_BUTTON_USER2[@]}"
            ;;

            $EEEPC_SLEEP)
                logger "acpi-eeepc-generic-handler.sh (hotkey): Sleep"
                eeepc_notify "Going to sleep..."
                execute_commands "${COMMANDS_SLEEP[@]}"
            ;;
            $EEEPC_WIFI_TOGGLE) # WiFi Toggle
                logger "acpi-eeepc-generic-handler.sh (hotkey): WiFi toggle"
                execute_commands "${COMMANDS_WIFI_TOGGLE[@]}"
                #eeepc_notify "Wireless" network-wireless
            ;;
            $EEEPC_WIFI_UP) # WiFi Up
                logger "acpi-eeepc-generic-handler.sh (hotkey): WiFi Up"
                execute_commands "${COMMANDS_WIFI_UP[@]}"
                #eeepc_notify "Wireless Up" network-wireless
            ;;
            $EEEPC_WIFI_DOWN) # WiFi Down
                logger "acpi-eeepc-generic-handler.sh (hotkey): WiFi Down"
                execute_commands "${COMMANDS_WIFI_DOWN[@]}"
                eeepc_notify "Wireless Down" network-wireless
            ;;
            $EEEPC_BRIGHTNESS_UP|$EEEPC_BRIGHTNESS_DOWN) # Brightness
                brightness_direction=`brightness_find_direction`
                if [ "$brightness_direction" == "up" ]; then
                    execute_commands "${COMMANDS_BRIGHTNESS_UP[@]}"
                    brightness_percentage=`brightness_get_percentage`
                    logger "acpi-eeepc-generic-handler.sh (hotkey): Brightness Up ($brightness_percentage%)"
                    eeepc_notify "Brightness Up ($brightness_percentage%)" dialog-information
                else
                    execute_commands "${COMMANDS_BRIGHTNESS_DOWN[@]}"
                    brightness_percentage=`brightness_get_percentage`
                    logger "acpi-eeepc-generic-handler.sh (hotkey): Brightness Down ($brightness_percentage%)"
                    eeepc_notify "Brightness Down ($brightness_percentage%)" dialog-information
                fi
            ;;
            $EEEPC_SCREEN_OFF) # Turn off screen
                logger "acpi-eeepc-generic-handler.sh (hotkey): Turn off screen"
                execute_commands "${COMMANDS_SCREEN_OFF[@]}"
                eeepc_notify "Turning screen off..." dialog-information
            ;;
            $EEEPC_XRANDR_TOGGLE) # RandR
                logger "acpi-eeepc-generic-handler.sh (hotkey): RandR"
                execute_commands "${COMMANDS_XRANDR_CLONE[@]}"
                eeepc_notify "Clone" video-display
            ;;
            $EEEPC_XRANDR_CLONE) # RandR (clone)
                logger "acpi-eeepc-generic-handler.sh (hotkey): RandR (clone)"
                execute_commands "${COMMANDS_XRANDR_CLONE[@]}"
                eeepc_notify "Clone" video-display
            ;;
            $EEEPC_XRANDR_VGA) # RandR (vga only)
                logger "acpi-eeepc-generic-handler.sh (hotkey): RandR (vga only)"
                eeepc_notify "VGA" video-display
                execute_commands "${COMMANDS_XRANDR_VGA[@]}"
            ;;
            $EEEPC_XRANDR_LCD) # RandR (lcd only)
                logger "acpi-eeepc-generic-handler.sh (hotkey): RandR (lcd only)"
                eeepc_notify "LCD" video-display
                execute_commands "${COMMANDS_XRANDR_LCD[@]}"
            ;;
            $EEEPC_TASKMAN) # Task Manager
                logger "acpi-eeepc-generic-handler.sh (hotkey): Task Manager"
                execute_commands_as_user "${COMMANDS_TASKM[@]}"
            ;;
            $EEEPC_VOL_MUTE) # Mute
                logger "acpi-eeepc-generic-handler.sh (hotkey): Mute"
                volume_level=`get_volume`
                volume_is_mute
                if [ $? == 1 ]; then
                    eeepc_notify "Mute ($volume_level%)" audio-volume-muted
                else
                    eeepc_notify "UnMute ($volume_level%)" audio-volume-medium
                fi
                execute_commands "${COMMANDS_MUTE[@]}"
            ;;
            $EEEPC_VOL_DOWN) # Volume Down
                execute_commands "${COMMANDS_VOLUME_DOWN[@]}"
                sleep 0.1
                volume_level=`get_volume`
                logger "acpi-eeepc-generic-handler.sh (hotkey): Volume Down"
                eeepc_notify "Volume Down ($volume_level%)" audio-volume-low
            ;;
            $EEEPC_VOL_UP) # Volume Up
                execute_commands "${COMMANDS_VOLUME_UP[@]}"
                sleep 0.1
                volume_level=`get_volume`
                logger "acpi-eeepc-generic-handler.sh (hotkey): Volume Up"
                eeepc_notify "Volume Up ($volume_level%)" audio-volume-high
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
		eeepc_notify  "ACPI group/action undefined: $1 $2 $3 $4"
		logger "ACPI group/action undefined: $1 $2 $3 $4"
		;;
esac

#su $XUSER --login -c "xhost -"


