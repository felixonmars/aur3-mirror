#! /bin/sh

source /etc/acpi/eee.conf

PWR=$(cat $WIRELESS_SWITCH)

logger "args are ${*} and PWR is $PWR"

case $1 in
	poweron)
		if [ "$PWR" = "0" ]; then
		        modprobe pciehp
		        sleep 1
		        echo 1 > $WIRELESS_SWITCH
			sleep 1
			echo "Loading wlan modules..."
			logger "Loading wlan modules..."
			modprobe $WIRELESS_MODULE
			sleep 2
			echo "Creating wlan interface"
			logger "Creating wlan interface"
			ifconfig $WIRELESS_DEVICE up
			$NETWORK_UP_COMMAND
			modprobe -r pciehp
			if [ $WIRELESS_MODULE = "iwl3945" ]; then
			    AC=`cat /proc/acpi/ac_adapter/AC0/state | awk '{ print $2 }'`
                    	    case $AC in 
                    		off-line)    
                        	    echo $WIRELESS_POWERSAVE > /sys/bus/pci/drivers/iwl3945/0000:01:00.0/power_level
                    		;;
                    		on-line)
                    		    echo 6 > /sys/bus/pci/drivers/iwl3945/0000:01:00.0/power_level
                    		;;
                    	    esac
                        fi

		fi
		;;


	poweroff)
		if [ "$PWR" = "1" ]; then
			modprobe pciehp
			$NETWORK_DOWN_COMMAND
			sleep 1
			echo "Turning interface down and unloading moduels"
			logger "Turning wifi down and unloading moduels"
			ifconfig $WIRELESS_DEVICE down
			sleep 1
			modprobe -r $WIRELESS_MODULE
			sleep 1
			echo "Turning wlan device power off"
			logger "Turning wlan device power off"
			echo 0 > $WIRELESS_SWITCH
			sleep 2
			modprobe -r pciehp
 		fi
		;;
esac
