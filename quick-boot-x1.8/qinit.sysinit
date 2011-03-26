#!/bin/bash
#
# /etc/rc.sysinit
#


# this starts readahead with your boot profile
/usr/sbin/readahead-list /etc/readahead/boot


. /etc/rc.conf
. /etc/rc.d/functions

echo " "
printhl "Arch Linux\n"
printhl "${C_H2}http://www.archlinux.org"
printhl "Copyright 2002-2007 Judd Vinet"
printhl "Copyright 2007-2009 Aaron Griffin"
printhl "Distributed under the GNU General Public License (GPL)"
printsep

# mount /proc, /sys and our RAM /dev
/bin/mount -n -t tmpfs none /dev -o mode=0755
/bin/mount -n -t proc none /proc
/bin/mount -n -t sysfs none /sys

# Copy static device nodes to /dev
/bin/cp -a /lib/udev/devices/* /dev/



./etc/qinit.mknod_blocks



# Default nodes
/bin/mknod -m 666 /dev/random c 1 8
/bin/mknod -m 666 /dev/urandom c 1 9 
/bin/mknod /dev/full c 1 7
/bin/mknod -m 640 /dev/kmem c 1 2
/bin/mknod -m 755 /dev/ptmx c 5 2

/bin/mknod -m 666 /dev/tty c 5 0
/bin/mknod -m 620 /dev/tty0 c 4 0
/bin/mknod -m 620 /dev/tty1 c 4 1
/bin/mknod -m 620 /dev/tty2 c 4 2
/bin/mknod -m 620 /dev/tty3 c 4 3
/bin/mknod -m 620 /dev/tty4 c 4 4
/bin/mknod -m 620 /dev/tty5 c 4 5
/bin/mknod -m 620 /dev/tty6 c 4 6
/bin/mknod -m 620 /dev/tty7 c 4 7

/bin/mknod -m 660 /dev/vcs c 7 0
/bin/mknod -m 660 /dev/vcs1 c 7 1
/bin/mknod -m 660 /dev/vcs2 c 7 2
/bin/mknod -m 660 /dev/vcs3 c 7 3
/bin/mknod -m 660 /dev/vcs4 c 7 4
/bin/mknod -m 660 /dev/vcs5 c 7 5
/bin/mknod -m 660 /dev/vcs6 c 7 6
/bin/mknod -m 660 /dev/vcs7 c 7 7

/bin/mknod -m 660 /dev/vcsa c 7 128
/bin/mknod -m 660 /dev/vcsa1 c 7 129
/bin/mknod -m 660 /dev/vcsa2 c 7 130
/bin/mknod -m 660 /dev/vcsa3 c 7 131
/bin/mknod -m 660 /dev/vcsa4 c 7 132
/bin/mknod -m 660 /dev/vcsa5 c 7 133
/bin/mknod -m 660 /dev/vcsa6 c 7 134
/bin/mknod -m 660 /dev/vcsa7 c 7 135

/bin/mknod -m 640 /dev/mem c 1 1


	#ATI
	/bin/mkdir -m 755 /dev/dri
	/bin/mknod -m 666 /dev/dri/card0 c 226 0
	#INTEL
	/bin/mkdir -p /dev/misc	
	/bin/mknod -m 600 /dev/misc/agpgart c 10 175
	/bin/ln -sfn /dev/misc/agpgart /dev/agpgart
	#NVIDIA
	/bin/mknod -m 666 /dev/nvidia0 c 195 0
	/bin/mknod -m 666 /dev/nvidiactl c 195 255


# start up our mini logger until syslog takes over
/sbin/minilogd

# anything more serious than KERN_WARNING goes to the console
# 'verbose' cmdline parameter enables more messages
if /bin/grep -q " verbose" /proc/cmdline; then
	/bin/dmesg -n 8
else
	/bin/dmesg -n 3
fi

# enable rtc access
/sbin/modprobe rtc-cmos >/dev/null 2>&1
RTC_MAJOR=$(/bin/grep -w rtc /proc/devices 2>/dev/null)
RTC_MAJOR="${RTC_MAJOR%% *}"
if [ -n "$RTC_MAJOR" ]; then
	/bin/mknod /dev/rtc0 c $RTC_MAJOR 0
	/bin/ln -s /dev/rtc0 /dev/rtc
fi

HWCLOCK_PARAMS="--hctosys"
if [ "$HARDWARECLOCK" = "UTC" ]; then
	HWCLOCK_PARAMS="$HWCLOCK_PARAMS --utc"
elif [ "$HARDWARECLOCK" = "localtime" ]; then
	HWCLOCK_PARAMS="$HWCLOCK_PARAMS --localtime"
else
	HWCLOCK_PARAMS=""
fi

# Set clock early to fix some bugs with filesystem checks
# Clock is set again later to match rc.conf
if [ -n "$HWCLOCK_PARAMS" -a -f /etc/localtime ]; then
	/sbin/hwclock $HWCLOCK_PARAMS --noadjfile
fi

echo > /proc/sys/kernel/hotplug

# Load modules from the MODULES array defined in rc.conf
if ! [ "$load_modules" = "off" ]; then
	if [ -f /proc/modules ]; then
		stat_busy "Loading Modules"
		for mod in "${MODULES[@]}"; do
			if [ "$mod" = "${mod#!}" ]; then
				/sbin/modprobe $mod
			fi
		done
		stat_done
	fi
	if [ -d /proc/acpi ]; then
		stat_busy "Loading standard ACPI modules"
		ACPI_MODULES="ac battery button fan processor thermal"
		k="$(echo $BLACKLIST ${MOD_BLACKLIST[@]} | /bin/sed 's|-|_|g')"
		j="$(echo ${MODULES[@]} | /bin/sed 's|-|_|g')"
		#add disabled MODULES (!) to blacklist - much requested feature
		for m in ${j}; do
    			[ "$m" != "${m#!}" ] && k="${k} ${m#!}"
		done
		# add disablemodules= from commandline to blacklist
		k="${k} $(echo ${disablemodules} | /bin/sed 's|-|_|g' | /bin/sed 's|,| |g')"
		for n in ${ACPI_MODULES}; do
			if ! echo ${k} | /bin/grep "\<$n\>" 2>&1 >/dev/null; then
				/sbin/modprobe $n > /dev/null 2>&1
			fi
		done
		stat_done
	fi
fi


# bring up the loopback interface
if [ -d /sys/class/net/lo ]; then
	stat_busy "Bringing up loopback interface"
	/sbin/ifconfig lo 127.0.0.1 up
	if [ $? -ne 0 ]; then
		stat_fail
	else
		stat_done
	fi
fi

# If necessary, find md devices and manually assemble RAID arrays
if [ -f /etc/mdadm.conf -a "$(/bin/grep ^ARRAY /etc/mdadm.conf 2>/dev/null)" ]; then
	# udev won't create these md nodes, so we do it ourselves
	for dev in $(/bin/grep ^ARRAY /etc/mdadm.conf | /bin/awk '{print $2}'); do
		path=$(echo $dev | /bin/sed 's|/[^/]*$||')
		node=$(echo $dev | /bin/sed "s|^$path/||")
		minor=$(echo $node | /bin/sed 's|^[^0-9]*||')
		[ ! -e $path/$node ] && /bin/mknod $path/$node b 9 $minor
	done
	status "Activating RAID arrays" /sbin/mdadm --assemble --scan
fi

if [ "$USELVM" = "yes" -o "$USELVM" = "YES" ]; then
	if [ -x /sbin/lvm -a -d /sys/block ]; then
		# Kernel 2.6.x, LVM2 groups
		/sbin/modprobe -q dm-mod 2>/dev/null
		stat_busy "Activating LVM2 groups"
		/sbin/lvm vgscan --ignorelockingfailure --mknodes >/dev/null
		/sbin/lvm vgchange --ignorelockingfailure -a y >/dev/null
		if [ $? -ne 0 ]; then
			stat_fail
		else
			stat_done
		fi
	fi
fi

# Set up non-root encrypted partition mappings
if [ -f /etc/crypttab -a -n "$(/bin/grep -v ^# /etc/crypttab | /bin/grep -v ^$)" ]; then
	/sbin/modprobe -q dm-mod 2>/dev/null
	stat_busy "Unlocking encrypted volumes:"
	csfailed=0
	CS=/sbin/cryptsetup.static
	do_crypt() {
		if [ $# -ge 3 ]; then
			cname="$1"
			csrc="$2"
			cpass="$3"
			shift 3
			copts="$*"
			stat_append "${cname}.."
			# For some fun reason, the parameter ordering varies for
			# LUKS and non-LUKS devices.  Joy.
			if [ "${cpass}" = "SWAP" ]; then
				# This is DANGEROUS! The only possible safety check
				# is to not proceed in case we find a LUKS device
				# This may cause dataloss if it is not used carefully
				if $CS isLuks $csrc 2>/dev/null; then
					false
				else
					$CS -d /dev/urandom $copts create $cname $csrc >/dev/null
					if [ $? -eq 0 ]; then
						stat_append "creating swapspace.."
						/sbin/mkswap -f -L $cname /dev/mapper/$cname >/dev/null
					fi
				fi
			elif [ "${cpass}" = "ASK" ]; then
				printf "\nOpening '${cname}' volume:\n"

				if $CS isLuks $csrc 2>/dev/null; then
					$CS $copts luksOpen $csrc $cname < /dev/console
				else
					$CS $copts create $cname $csrc < /dev/console
				fi
			elif [ "${cpass:0:1}" != "/" ]; then
				if $CS isLuks $csrc 2>/dev/null; then
					echo "$cpass" | $CS $copts luksOpen $csrc $cname >/dev/null
				else
					echo "$cpass" | $CS $copts create $cname $csrc >/dev/null
				fi
			else
				if $CS isLuks $csrc 2>/dev/null; then
					$CS -d $cpass $copts luksOpen $csrc $cname >/dev/null
				else
					$CS -d $cpass $copts create $cname $csrc >/dev/null
				fi
			fi
			if [ $? -ne 0 ]; then
				csfailed=1
				stat_append "failed "
			else
				stat_append "ok "
			fi
		fi
	}
	while read line; do
		eval do_crypt "$line"
	done </etc/crypttab
	if [ $csfailed -eq 0 ]; then
		stat_done
	else
		stat_fail
	fi
	# Maybe someone has LVM on an encrypted block device
	if [ "$USELVM" = "yes" -o "$USELVM" = "YES" ]; then
		if [ -x /sbin/lvm -a -d /sys/block ]; then
			/sbin/lvm vgscan --ignorelockingfailure --mknodes >/dev/null
			/sbin/lvm vgchange --ignorelockingfailure -a y >/dev/null
		fi
	fi
fi

status "Mounting Root Read-only" /bin/mount -n -o remount,ro /

FORCEFSCK=
[ -f /forcefsck ] && FORCEFSCK="-- -f"
NETFS="nonfs,nonfs4,nosmbfs,nocifs,nocodafs,noncpfs,nosysfs,noshfs,nofuse,nofuseblk,noglusterfs"

fsck_reboot() {
	echo "Automatic reboot in progress..."
	/bin/umount -a
	/bin/mount -n -o remount,ro /
	/sbin/reboot -f
	exit 0
}

if [ -x /sbin/fsck ]; then
	stat_busy "Checking Filesystems"
	FSCK_OUT=/dev/stdout
	FSCK_ERR=/dev/null
	/sbin/fsck -A -T -C -a -t $NETFS $FORCEFSCK >$FSCK_OUT 2>$FSCK_ERR
	fsckret=$?
	if [ ${fsckret} -gt 1 ]; then
		stat_fail
	fi
	if [ $((${fsckret}&2)) -eq 2 ]; then
		echo
		echo "********************** REBOOT REQUIRED *********************"
		echo "*                                                          *"
		echo "* The system will be rebooted automatically in 15 seconds. *"
		echo "*                                                          *"
		echo "************************************************************"
		echo
		/bin/sleep 15
		fsck_reboot
	fi
	if [ ${fsckret} -gt 1 -a ${fsckret} -ne 32 ]; then
		echo
		echo "*****************  FILESYSTEM CHECK FAILED  ****************"
		echo "*                                                          *"
		echo "*  Please repair manually and reboot. Note that the root   *"
		echo "*  file system is currently mounted read-only. To remount  *"
		echo "*  it read-write type: mount -n -o remount,rw /            *"
		echo "*  When you exit the maintenance shell the system will     *"
		echo "*  reboot automatically.                                   *"
		echo "*                                                          *"
		echo "************************************************************"
		echo
		/sbin/sulogin -p
		fsck_reboot
	fi
	stat_done
fi

stat_busy "Mounting Local Filesystems"
/bin/mount -n -o remount,rw /
/bin/rm -f /etc/mtab*
# make sure / gets written to /etc/mtab
/bin/mount -o remount,rw /
# Write /proc, /sys and /dev to /etc/mtab
if [ -e /proc/mounts ]; then
	/bin/grep -e "/proc " -e "/sys " -e "/dev " /proc/mounts >> /etc/mtab
fi
# now mount all the local filesystems
/bin/mount -a -t $NETFS -O no_netdev
stat_done

stat_busy "Removing Leftover Files"
/bin/rm -f /etc/nologin &>/dev/null
/bin/rm -f /etc/shutdownpid &>/dev/null
/bin/rm -f /var/lock/* &>/dev/null
/bin/rm -rf /tmp/* /tmp/.* &>/dev/null
/bin/rm -f /forcefsck &>/dev/null
(cd /var/run && /usr/bin/find . ! -type d -exec /bin/rm -f -- {} \; )
: > /var/run/utmp
/bin/chmod 0664 /var/run/utmp
# Keep {x,k,g}dm happy with xorg
/bin/mkdir /tmp/.ICE-unix && /bin/chmod 1777 /tmp/.ICE-unix
/bin/mkdir /tmp/.X11-unix && /bin/chmod 1777 /tmp/.X11-unix
stat_done

#status "Updating Shared Library Links" /sbin/ldconfig

if [ "$HOSTNAME" != "" ]; then
	status "Setting Hostname: $HOSTNAME" /bin/hostname $HOSTNAME
fi


#status "Updating Module Dependencies" /sbin/depmod -A

# Flush old locale settings
#: >/etc/profile.d/locale.sh
#/bin/chmod 755 /etc/profile.d/locale.sh
# Set user defined locale
#[ -z "$LOCALE" ] && LOCALE="en_US"
#stat_busy "Setting Locale: $LOCALE"
#echo "export LANG=$LOCALE" >>/etc/profile.d/locale.sh
#stat_done

#if echo "$LOCALE" | /bin/grep -qi utf ; then
#	stat_busy "Setting Consoles to UTF-8 mode"
#	# UTF-8 consoles are default since 2.6.24 kernel
#	# this code is needed not only for older kernels,
#	# but also when user has set vt.default_utf8=0 but LOCALE is *.UTF-8.
#	for i in /dev/tty[0-9]*; do
#		/usr/bin/kbd_mode -u < ${i}
#		printf "\e%%G" > ${i}
#	done
#	# the $CONSOLE check helps us avoid this when running scripts from cron
#	echo 'if [ "$CONSOLE" = "" -a "$TERM" = "linux" -a -t 1 ]; then printf "\e%%G"; fi' >>/etc/profile.d/locale.sh
#	stat_done
#	[ -n "$KEYMAP" ] && status "Loading Keyboard Map: $KEYMAP" /bin/loadkeys -q -u $KEYMAP
#else
#	stat_busy "Setting Consoles to legacy mode"
#	# make non-UTF-8 consoles work on 2.6.24 and newer kernels
#	for i in /dev/tty[0-9]*; do
#		/usr/bin/kbd_mode -a < ${i}
#		printf "\e%%@" > ${i}
#	done
#	# the $CONSOLE check helps us avoid this when running scripts from cron
#	echo 'if [ "$CONSOLE" = "" -a "$TERM" = "linux" -a -t 1 ]; then printf "\e%%@"; fi' >>/etc/profile.d/locale.sh
#	stat_done
#	[ -n "$KEYMAP" ] && status "Loading Keyboard Map: $KEYMAP" /bin/loadkeys -q $KEYMAP
#fi

#if [ -n "$CONSOLEFONT" ]; then
#	stat_busy "Loading Console Font: $CONSOLEFONT"
#	#CONSOLEMAP in UTF-8 shouldn't be used
#	if [ -n "$CONSOLEMAP" ] && echo "$LOCALE" | /bin/grep -qi utf ; then
#		CONSOLEMAP=""
#	fi
#	for i in /dev/tty[0-9]*; do
#		if [ -n "$CONSOLEMAP" ]; then
#			/usr/bin/setfont -m $CONSOLEMAP $CONSOLEFONT -C ${i} >/dev/null 2>&1
#		else
#			/usr/bin/setfont $CONSOLEFONT -C ${i} >/dev/null 2>&1
#		fi
#	done
#	if [ $? -ne 0 ]; then
#		stat_fail
#	else
#		for i in /dev/tty[0-9]*; do
#			printf "\e(K" > ${i}
#		done
#		# the $CONSOLE check helps us avoid this when running scripts from cron
#		echo 'if [ "$CONSOLE" = "" -a "$TERM" = "linux" -a -t 1 ]; then printf "\e(K"; fi' >>/etc/profile.d/locale.sh
#		stat_done
#	fi
#fi

# Setting console lang
 /bin/loadkeys -q $KEYMAP

# Starting Xorg
if [ -x /etc/rc.local ]; then
	/etc/rc.local &
fi

# End of file
# vim: set ts=2 noet:

