#!/bin/sh
dev_group=cyberjack
dev_mode=0664

# using the cyberJack libusb driver
if [ -n "${DEVICE}" ]; then
	dev="${DEVICE}"
	# hack for >=libusb-0.1.12
	# which uses /dev/bus/usb/NNN/MMM
	# instead of /proc/bus/usb/NNN/MMM
	case "${dev}" in
		/proc/bus/usb/*)
			dev="${dev} ${dev/proc/dev}"
			;;
	esac
fi

# using the cyberJack kernel module
if [ -n "${DEVNAME}" ]; then
	dev="${DEVNAME}"
fi

# set device group and permissions
for d in ${dev}; do
	/bin/chgrp "${dev_group}" "${d}"
	/bin/chmod "${dev_mode}" "${d}"
done

