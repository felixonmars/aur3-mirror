#!/bin/sh
groups | grep -q '\bgames\b';
if [ $? == 1 ];then
	echo "You must be in the group 'games' to play Clonk Rage."
else
	cd /opt/clonk_rage/
	# GCONV_PATH="/opt/lib32/usr/lib/gconv/" exec ./clonk $*
	exec ./clonk64 $*
fi
