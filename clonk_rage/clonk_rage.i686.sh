#!/bin/sh
groups | grep -q '\bgames\b';
if [ $? == 1 ];then
	echo "You must be in the group 'games' to play Clonk Rage."
else
	cd /opt/clonk_rage/
	exec ./clonk $*
fi
