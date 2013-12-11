#!/bin/sh

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && type dbus-launch >/dev/null; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
fi

#export XDG_RUNTIME_DIR=/var/run/user/`id -u`
#export PULSE_RUNTIME_PATH=$XDG_RUNTIME_DIR/pulse
#export SDL_AUDIODRIVER=alsa
#export SDL_AUDIODRIVER=pulseaudio

/usr/bin/start-pulseaudio-x11 &

xfwm4 --replace --daemon --compositor=off &

exec steam -bigpicture

