#!/bin/bash
# скрипт для управления звуком
# зависимости: bash, alsa-utils, sed

case "$1" in 
    +|+5)
# --- +5% громкости ---
	amixer -- sset Master playback 5%+
	;;
    -|-5)
# --- -5% громкости ---
	amixer -- sset Master playback 5%-
	;;
    mute|*)
# --- mute ---
	if [ "$(amixer -- sget Master playback | sed -e '/^.*Playback.*\[on\].*/!d')" != "" ]; then
	 amixer -- sset Master mute
	else
	 amixer -- sset Master unmute
	fi
	;;
esac
