#! /bin/sh

source /etc/acpi/eee.conf

PWR=$(cat /sys/class/rfkill/rfkill0/state)

case $1 in
	poweron)
		if [ "$PWR" = "1" ]; then
			modprobe pciehp pciehp_force=1
			sleep 1
			ifconfig wlan0 up
			#(sleep 1; $NETWORK_UP_COMMAND) &
		fi
		;;

	poweroff)
		if [ "$PWR" = "0" ]; then
			ifconfig wlan0 down
			sleep 3
			rmmod pciehp
			rmmod pci_hotplug
			#(sleep 1; $NETWORK_DOWN_COMMAND) &
		fi
		;;
esac
