#!/bin/sh

# This script is called from asusosd

# Since the latest alsa in kernel 2.6.25 we now have Line-Out instead
# of LineOut, added check for this

# if [ $(amixer|grep Line-Out | wc -l) -gt 0 ];then
# LINEOUT="Line-Out"
# else
# if [ $(amixer|grep LineOut | wc -l) -gt 0 ];then
# LINEOUT="LineOut"
# else
# LINEOUT="Front"
# fi
# fi

case $1 in
	status)
		#amixer get PCM | grep "Front Right: Playback"
        amixer get iSpeaker | grep "Front Right: Playback"
		;;
	volume)
		amixer get PCM|grep -A 1 -e Mono|grep -o -e '[0-9]*%'|grep -o -e '[0-9]*'
#         amixer get $LINEOUT | grep "Front Right: Playback" |grep -o -e '[0-9]*%'|grep -o -e '[0-9]*'
		;;
    toggle)
        amixer set LineOut toggle
        amixer set iSpeaker toggle
        ;;
	on)
		amixer sset LineOut unmute
		amixer sset iSpeaker unmute
		;;
	off)
		amixer sset LineOut mute
		amixer sset iSpeaker mute
		;;
esac
