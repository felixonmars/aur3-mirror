#!/bin/bash
#
# /etc/rc.multi
#

. /etc/rc.conf
. /etc/rc.d/functions

# Starting HAL
#if [ -x /etc/rc.d/hal ]; then
#	/etc/rc.d/hal start
#fi


# Starting UDEV
if [ -x /sbin/udevadm ]; then
	/sbin/udevd --daemon
fi
if /bin/pidof -o %PPID /sbin/udevd >/dev/null; then
  /sbin/udevadm trigger &
fi
if /bin/pidof -o %PPID /sbin/udevd >/dev/null; then
	/sbin/udevadm settle
fi


# Activating Swap
/sbin/swapon -a


stat_busy "Configuring System Clock"
if [ ! -f /var/lib/hwclock/adjtime ]; then
	echo "0.0 0 0.0" > /var/lib/hwclock/adjtime
fi
if [ "$TIMEZONE" != "" -a -e "/usr/share/zoneinfo/$TIMEZONE" ]; then
	/bin/rm -f /etc/localtime
	/bin/cp "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
fi

if [ -n "$HWCLOCK_PARAMS" ]; then
	/sbin/hwclock --adjust #Adjust for system drift
	/sbin/hwclock $HWCLOCK_PARAMS
fi
stat_done

RANDOM_SEED=/var/lib/misc/random-seed
if [ -f $RANDOM_SEED ]; then
	stat_busy "Initializing Random Seed"
	/bin/cat $RANDOM_SEED > /dev/urandom
	stat_done
fi


# Load sysctl variables if sysctl.conf is present
[ -r /etc/sysctl.conf ] && /sbin/sysctl -q -p &>/dev/null

# Start daemons
for daemon in "${DAEMONS[@]}"; do
	if [ "$daemon" = "${daemon#!}" ]; then
		if [ "$daemon" = "${daemon#@}" ]; then
			start_daemon $daemon
		else
			start_daemon_bkgd ${daemon:1}
		fi
	fi
done


# Set the NIS domain name, if necessary
[ -f /etc/conf.d/nisdomainname ] && . /etc/conf.d/nisdomainname
if [ "$NISDOMAINNAME" != "" ]; then
	status "Setting NIS Domain Name: $NISDOMAINNAME" /bin/nisdomainname $NISDOMAINNAME
fi


# Adding persistent network/cdrom generated rules
if [ -f "/dev/.udev/tmp-rules--70-persistent-cd.rules" ]; then
	stat_busy "Adding persistent cdrom udev rules"
	/bin/cat /dev/.udev/tmp-rules--70-persistent-cd.rules >> /etc/udev/rules.d/70-persistent-cd.rules
	stat_done
fi
if [ -f "/dev/.udev/tmp-rules--70-persistent-net.rules" ]; then
	stat_busy "Adding persistent network udev rules"
	/bin/cat /dev/.udev/tmp-rules--70-persistent-net.rules >> /etc/udev/rules.d/70-persistent-net.rules
	stat_done
fi

/bin/dmesg >| /var/log/dmesg.log

