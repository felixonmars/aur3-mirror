#! /bin/sh

source /etc/acpi/eee.conf

PWR=$(cat /proc/acpi/asus/wlan || cat /sys/devices/platform/eeepc/wlan)

load_modules() {
	modprobe ath_pci
	modprobe wlan_wep
	modprobe wlan_tkip
	modprobe wlan_ccmp
}

unload_modules() {
	madwifi-unload
}

case $1 in
	poweron)
		if [ "$PWR" = "0" ]; then
			modprobe pciehp pciehp_force=1
			sleep 1
			echo 1 > /proc/acpi/asus/wlan
			echo 1 > /sys/devices/platform/eeepc/wlan
			sleep 2
			echo "Loading wlan modules..."
			load_modules
			sleep 1
			echo "Creating wlan interface"
			logger "create wlan interface"
			wlanconfig ath0 create wlandev wifi0 wlanmode sta nosbeacon
			sleep 1
			ifconfig ath0 up
			# Loop to the eternity!!! bawwaawawa, well once should be enough. >)
			if ifconfig ath0 > /dev/null
			then
				echo "Running network up command!"
				if [ -e /tmp/eeewlanfailcounter ]; then rm /tmp/eeewlanfailcounter;fi
				(sleep 1; $NETWORK_UP_COMMAND) &
			else
				FAILC=$(</tmp/eeewlanfailcounter) || FAILC=0
				echo "Current fail count is $FAILC"
				if [ $FAILC -gt 2 ];
				then
					logger "Could not bring up WLAN."
					echo "Could not bring up WLAN, sorry. See dmesg for more information!"
					exit 1
				fi
				echo $(expr $FAILC + 1) > /tmp/eeewlanfailcounter
				/etc/acpi/wlan.sh poweroff
				/etc/acpi/wlan.sh poweron
			exit 1
			fi
		fi
		;;


	poweroff)
		if [ "$PWR" = "1" ]; then
			logger "remove wlan interface"
			echo "Removing wlan interface and unloading modules"
			ifconfig ath0 down
			sleep 1
			wlanconfig ath0 destroy
			unload_modules
			echo "Turning wlan device power off"
			echo 0 > /proc/acpi/asus/wlan
			echo 0 > /sys/devices/platform/eeepc/wlan
			sleep 1
			rmmod pciehp
			rmmod pci_hotplug
			echo "Running network down command"
			(sleep 1; $NETWORK_DOWN_COMMAND) &
 		fi
		;;
esac
