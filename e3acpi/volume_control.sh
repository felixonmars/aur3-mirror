#!/bin/sh

# Since the latest alsa in kernel 2.6.25 we now have Line-Out instead 
# of LineOut, added check for this

if [ $(amixer|grep Line-Out | wc -l) -gt 0 ];then
LINEOUT="Line-Out"
else
LINEOUT="LineOut"
fi

case $1 in
	status)
		amixer get $LINEOUT | grep "Front Right: Playback"
		;;
	volume)
		amixer get $LINEOUT|grep -A 1 -e Mono|grep -o -e '[0-9]*%'|grep -o -e '[0-9]*'
		;;
	on)
#		amixer sset LineOut unmute
#		amixer sset iSpeaker unmute
		;;
	off)
#		amixer sset LineOut mute
#		amixer sset iSpeaker mute
		;;
esac
