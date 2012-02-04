#!/bin/bash

#
# cryptcfg by Jakub Schmidtke <sjakub@gmail.com>
#
# Based on netcfg script from Arch's initscripts 0.8-12 package.
#
#
# Version 0.3 - added LUKS support
#

. /etc/rc.conf
. /etc/rc.d/functions

CRYPTCFG_VER=0.3
PATH="/bin:/usr/bin:/sbin:/usr/sbin:$PATH"

PROFILE_DIR="/etc/crypt-profiles"


version()
{
	echo "cryptcfg v$CRYPTCFG_VER"
}

usage()
{
	version
	echo
	echo "usage: cryptcfg <profile_name>"
	echo "       crypcfg --stop <profile_name>"
	echo "       cryptcfg --menu"
	echo "       cryptcfg --stopall"
	echo
	echo "Crypt profiles are stored in $PROFILE_DIR"
	echo
}

is_started_prof()
{
	[ "$1" = "" ] && return 0
	
	[ ! -f $PROFILE_DIR/$1 ] && return 0

	unset DISK_DEVICE MAP_DEVICE
	
	. $PROFILE_DIR/$1

	[ "$DISK_DEVICE" = "" ] && return 0
	
	[ ! -b $DISK_DEVICE ] && return 0
	
	if [ "$CRYPT_METHOD" = "truecrypt" ]; then	
		
		MAP_DEVICE=$( truecrypt -l | grep $DISK_DEVICE"$" | cut -d' ' -f1 )
		
		[ ${#MAP_DEVICE} -eq 0 ] && return 0
		
		return 1
		
	elif [ "$CRYPT_METHOD" = "luks" ]; then
		
		[ "$MAP_ALIAS" = "" ] && return 0
		
		CRYPT_STATUS=$( cryptsetup status $MAP_ALIAS | grep /dev/mapper | cut -d ' ' -f3 | cut -d '.' -f 1 | cut -d ':' -f1 )
		
		[ "$CRYPT_STATUS" = "active" ] && return 1
		
		return 0
	fi
	
	return 0
}

stop_profile()
{
	if [ "$1" = "" ]; then
		echo "error: missing profile name"
		exit 1
	fi
	
	PROF=$1
	
	is_started_prof $PROF
	ret=$?
	
	if [ "$ret" = "0" ]; then
		echo "error: profile $PROF not started"
		exit 1
	fi

	unset DISK_DEVICE
	unset MAP_ALIAS
	unset CRYPT_METHOD
	
	. $PROFILE_DIR/$PROF
	
	if [ ! -b $DISK_DEVICE ]; then
		echo "error: $PROF profile contains no valid DISK_DEVICE!"
		exit 1
	fi
	
	if [ "$CRYPT_METHOD" = "truecrypt" ]; then
		
		stat_busy "Shutting down profile: $PROF"

		truecrypt -d $DISK_DEVICE
	
		if [ $? -ne 0 ] ; then
			echo "error dismounting and/or unmapping $DISK_DEVICE volume"
			exit 1
		fi
		
	elif [ "$CRYPT_METHOD" = "luks" ]; then			
		if [ ! -b /dev/mapper/$MAP_ALIAS ]; then
			echo "error: /dev/mapper/$MAP_ALIAS is not a valid block device!"
			exit 1
		fi
	
		stat_busy "Shutting down profile: $PROF"
		
		# space after MAP_ALIAS is important!
		MOUNT_STATUS=$( mount | grep "/dev/mapper/$MAP_ALIAS " )
		
		if [ ! "$MOUNT_STATUS" = "" ]; then
			stat_busy "umounting /dev/mapper/$MAP_ALIAS"
			
			umount "/dev/mapper/$MAP_ALIAS"
			
			if [ $? -ne 0 ]; then
				echo "error umounting /dev/mapper/$MAP_ALIAS"
				exit 1
			fi
			
			cryptsetup luksClose $MAP_ALIAS
			
			if [ $? -ne 0 ]; then
				echo "error closing $MAP_ALIAS crypt device!"
				exit 1
			fi
		fi

	else
		echo "error: $PROF profile contains no valid CRYPT_METHOD!"
		exit 1
	fi
}

stop_all()
{
	for i in /dev/mapper/truecrypt*; do
		if [ -b "$i" ]; then
			echo "Closing $i..."
			truecrypt -d $i
		fi
	done
	
	for i in /dev/mapper/*; do
		if [ ! "$i" = "/dev/mapper/control" ]; then
			if [ -b "$i" ]; then
				echo "Closing $i..."
				umount $i
				cryptsetup luksClose $i
			fi
		fi
	done
	
	exit 0
}

password_prompt()
{
	if [ "$DISK_DEVICE" = "" ]; then
		echo "error: missing DISK_DEVICE"
		exit 1
	fi

	if [ ! -b $DISK_DEVICE ]; then
		echo "error: $DISK_DEVICE block device does not exist"
		exit 1
	fi
	
	if [ "$MOUNT_DIR" = "" ]; then
		echo "error: missing MOUNT_DIR"
		exit 1
	fi

	if [ "$CRYPT_METHOD" = "" ]; then
		echo "error: missing CRYPT_METHOD"
		exit 1
	fi
	
	if [ "$CRYPT_METHOD" = "luks" ]; then	
		if [ "$MAP_ALIAS" = "" ]; then
			echo "error: missing MAP_ALIAS"
			exit 1
		fi
	fi
	
	D_PARAMS=""
	
	[ "$NO_ASTERISKS" = "" -o "$NO_ASTERISKS" = "0" ] && D_PARAMS="--insecure"
	
	RESULT=$( mktemp ) || exit 1

	if [ "$CRYPT_METHOD" = "truecrypt" ]; then
		dialog \
			--stdout \
			$D_PARAMS \
			--passwordbox \
			"Enter password for encrypted volume $DISK_DEVICE:\n\n$DESCRIPTION\n " \
			12 60 | truecrypt $CRYPT_OPTIONS $DISK_DEVICE > $RESULT 2>&1
	elif [ "$CRYPT_METHOD" = "luks" ]; then
		dialog \
			--stdout \
			$D_PARAMS \
			--passwordbox \
			"Enter password for encrypted volume $DISK_DEVICE:\n\n$DESCRIPTION\n " \
			12 60 | cryptsetup $CRYPT_OPTIONS luksOpen $DISK_DEVICE $MAP_ALIAS > $RESULT 2>&1
	else
		rm $RESULT
		echo "error: Unknown CRYPT_METHOD ($CRYPT_METHOD)"
		exit 1
	fi
	
	rets=( ${PIPESTATUS[0]} ${PIPESTATUS[1]} )
	
	ret_dlg=${rets[0]}
	ret_tc=${rets[1]}
	
	res=$( cat $RESULT )
	rm $RESULT

	# If user pressed 'ok'
	if [ "$ret_dlg" = "0" ]; then
		if [ ! "$ret_tc" = "0" ]; then
			dialog --msgbox "$res" 10 60
			# Abnormal return status - report it
			return 1
		fi
		
		# Everything fine
		return 0
	fi
	
	# Otherwise it was cancel, or ESC
	return 2
}

start_profile()
{
	if [ "$1" = "" ]; then
		echo "error: missing profile name"
		exit 1
	fi
	
	if [ ! -f $PROFILE_DIR/$1 ]; then
		echo "error: $PROFILE_DIR/$1 is missing"
		exit 1
	fi
	
	is_started_prof $1
	ret=$?
	
	if [ "$ret" = "1" ]; then
		echo "error: $1 profile is already started"
		exit 1
	fi

	stat_busy "Starting crypt profile: $1"

	# ead the profile
	unset DESCRIPTION DISK_DEVICE MAP_DEVICE CRYPT_OPTIONS NO_ASTERISKS MOUNT_DIR CRYPT_METHOD MAP_ALIAS
	
	. $PROFILE_DIR/$1

	password_prompt
	
	ret=$?
	
	# Password prompt was canceled
	[ "$ret" = "2" ] && return 2
	
	# There was an error in password prompt
	[ "$ret" = "1" ] && return 1
	
	if [ "$CRYPT_METHOD" = "truecrypt" ]; then
		
		MAP_DEVICE=$( truecrypt -l | grep $DISK_DEVICE"$" | cut -d' ' -f1 )

		if [ ${#MAP_DEVICE} -eq 0 ]; then
			echo "$DISK_DEVICE volume not opened"
			exit 1;
		fi
	
		mount $MAP_DEVICE $MOUNT_DIR
	
		ret=$?
		
		[ "$ret" = "0" ] && return 0
		
		sleep 2
		
		truecrypt -d $MAP_DEVICE
	
		echo "error mounting $MAP_DEVICE device to $MOUNT_DIR"
	
		exit 1
	elif [ "$CRYPT_METHOD" = "luks" ]; then
		
		if [ "$MAP_ALIAS" = "" ]; then
			echo "error: Missing MAP_ALIAS";
			exit 1
		fi
		
		if [ ! -b "/dev/mapper/$MAP_ALIAS" ]; then
			echo "/dev/mapper/$MAP_ALIAS is not a block device!"
			exit 1
		fi

		mount "/dev/mapper/$MAP_ALIAS" $MOUNT_DIR
		
		ret=$?
		
		[ "$ret" = "0" ] && return 0
		
		sleep 2
		
		cryptsetup luksClose $MAP_ALIAS
		
		echo "error mounting /dev/mapper/$MAP_ALIAS device to $MOUNT_DIR"
		
		exit 1
	fi

	# Not really needed (as password_prompt should fail already), but for completness
	echo "Unknown CRYPT_METHOD"
	exit 1
}

menu()
{
	if [ "`ls $PROFILE_DIR 2>/dev/null | grep -v ^template$`" = "" -o ! -d $PROFILE_DIR ]; then
		echo "No profiles found. Add profiles to $PROFILE_DIR"
		exit 1
	fi

	# scan all profiles
	unset profiles
	DEFAULT=
	i=0
	for prof in $( ls $PROFILE_DIR ); do
		# ignore the template
		[ "$prof" = "template" ] && continue

		# ignore already started profiles
		is_started_prof $prof
		ret=$?
		
		[ "$ret" = "1" ] && continue

		NAME=$prof
		
		# if there's a profile called "main", use that as default
		[ "$NAME" = "main" ] && DEFAULT=$NAME
		
		unset DESCRIPTION
		. $PROFILE_DIR/$NAME

		if [ "$DESCRIPTION" ]; then
			profiles[$i]=$NAME
			i=$((i+1))
			profiles[$i]=$DESCRIPTION
			i=$((i+1))
		fi
	done

	# No profiles to be started left
	if [ ${#profiles} -eq 0 ]; then
		echo "All available profiles started"
		exit 0
	fi

	# if no default yet, use the first entry
	[ "$DEFAULT" = "" ] && DEFAULT=${profiles[0]}

	# profiles[2] is null - so we have only one profile left.
	# Don't display list of profiles, just ask fo a password.
	if [ "${profiles[2]}" = "" ]; then
		start_profile $DEFAULT
		ret=$?
	
		# Since this is the last profile, we can exit the script
		# if it was successfully opened, or the dialog was canceled.
		
		# It was successful
		[ "$ret" = "0" ] && exit 0
					
		# It was canceled
		[ "$ret" = "2" ] && exit 0
		
		# Otherwise there was an error

		return
	fi
	
	ANSWER=`mktemp` || exit 1

	dialog \
		--output-fd 1 \
		--default-item $DEFAULT \
		--menu "Select the crypt profile you wish to use" \
		13 50 6 \
		"${profiles[@]}" >$ANSWER
	ret=$?
	
	ans=$( cat $ANSWER )
	rm $ANSWER

	case $ret in
		1) exit 0 ;;   # cancel
		255) exit 0 ;; # ESC pressed (or timeout, but we don't use it)
		0) start_profile $ans ;;  # user selection
		# abnormal
		*) echo "abnormal ret code from dialog: $ret"; exit 1 ;;
	esac
}

#
#  Begin
#

if [ "`id -u`" != "0" ]; then
	echo "This script should be run as root."
	exit 1
fi

/sbin/modprobe -q dm-mod 2>/dev/null

# Parse command line
MODE="profile"
PROFILE=
SPROF=
while [ $# -ne 0 ]; do
	case $1 in
		--version) MODE="ver"     ;;
		--help)    MODE="usage"   ;;
		--menu)    MODE="menu"    ;;
		--stopall) MODE="stopall" ;;
		--stop)    MODE="stop"
		           shift
		           SPROF=$1       ;;
		--*)       MODE="usage"   ;;
		-*)        MODE="usage"   ;;
		*)         PROFILE=$1     ;;
	esac
	shift
done

if [ "$MODE" = "profile" -a "$PROFILE" = "" ]; then
	MODE="usage"
fi

# Figure out what we're doing...
[ "$MODE" = "ver" ]     && version
[ "$MODE" = "usage" ]   && usage
[ "$MODE" = "stop" ]    && stop_profile $SPROF
[ "$MODE" = "stopall" ] && stop_all
[ "$MODE" = "menu" ]    && while true; do menu; done;

if [ "$MODE" = "profile" ]; then
	start_profile $PROFILE
	ret=$?
	
	[ "$ret" = "0" ] && exit 0
	[ "$ret" = "2" ] && exit 0
	
	exit 1
fi

exit 0
