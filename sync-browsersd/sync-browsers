#!/bin/bash
# Script by graysky <graysky AT archlinux DOT us>
# Adapted from a script by Colin Verot at http://www.verot.net/firefox_tmpfs.htm

. /etc/sync-browsersd.conf

sync() {
	for user in $USERS; do
		for i in mozilla chromium; do
			[[ "$i" = "mozilla" ]] && STATIC="/home/$user/.$i-backup" && LINK="/home/$user/.$i"
			[[ "$i" = "chromium" ]] && STATIC="/home/$user/.config/$i-backup" && LINK="/home/$user/.config/$i"

			# check if user has browser profile
			if [[ -d $LINK ]]; then
				[[ -r "$VOLATILE/$user-$i" ]] || su -c "install -dm755 $VOLATILE/$user-$i" $user

				# backup profile and link to tmpfs
				if [[ $(readlink "$LINK") != "$VOLATILE/$user-$i" ]]; then
					mv $LINK $STATIC
					ln -s $VOLATILE/$user-$i $LINK
				fi

				# sync the RAM profile to the disc
				if [[ -e $LINK/.flagged ]]; then
					su -c "rsync -a --delete --exclude .flagged $LINK/ $STATIC/" $user
				else
					su -c "rsync -a $STATIC/ $LINK/" $user
					su -c "touch $LINK/.flagged" $user
				fi
			else
				/bin/true
			fi
		done
	done
}

unsync() {
	for user in $USERS; do
		for i in mozilla chromium; do
			[[ "$i" = "mozilla" ]] && STATIC="/home/$user/.$i-backup" && LINK="/home/$user/.$i"
			[[ "$i" = "chromium" ]] && STATIC="/home/$user/.config/$i-backup" && LINK="/home/$user/.config/$i"

			# check if user has browser profile
			if [[ -h $LINK ]]; then
				rm -f $LINK
				[[ -d $STATIC ]] && mv $STATIC $LINK
				[[ -d "$VOLATILE/$user-$i" ]] && rm -rf $VOLATILE/$user-$i
			else
				/bin/true
			fi
		done
	done
}

case "$1" in
	sync)
		[[ -f /run/daemons/sync-browsersd ]] && sync
		;;
	unsync)
		[[ -f /run/daemons/sync-browsersd ]] && unsync
		;;
	*)
		[[ -f /run/daemons/sync-browsersd ]] && echo "You should not call this script directly, let the /etc/rc.d/sync-browsersd do it for you!" && exit 1
esac
exit 0
