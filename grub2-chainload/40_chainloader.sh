#!/bin/bash

blkid | sort | while read line
do
	DEV_PATH=$(echo $line | sed 's/:.*//')

	# skip if partition is mounted as root /
	[ -n "$(mount -l | grep " / " | grep "$DEV_PATH")" ] && continue

	# skip if partition hasnt boot flag (*)
	[ -z "$(fdisk -l | grep "*" | grep "$DEV_PATH")" ] && continue
	
	# vars used later
	DEV=$(echo $DEV_PATH | sed 's/\/dev\///')
	LABEL=$(echo $line | grep 'LABEL=' | sed 's/.*LABEL="//' | sed 's/".*//')
	[ -n "$LABEL" ] && LABEL=" [$LABEL]"
	FS=$(echo $line | grep 'TYPE=' | sed 's/.*TYPE="//' | sed 's/".*//')
	DEV_NR=$(echo ${DEV:2:1} | tr abcdefgh 01234567)
	#PART_NR=${DEV:3:1}

	# output print
	echo "Found boot flag on $DEV_PATH$LABEL" >&2
	# insmod isnt tested (hfsplus, iso9660, ntfs ...) , so its commented out
	cat <<EOF
menuentry "Chainload 2 $DEV$LABEL" {
	# insmod $FS
	set root=(hd$DEV_NR,${DEV:3:1})
	chainloader +1
}
EOF
done
