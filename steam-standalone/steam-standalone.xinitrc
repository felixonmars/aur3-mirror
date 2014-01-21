#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#export XDG_RUNTIME_DIR=/var/run/user/`id -u`
#export PULSE_RUNTIME_PATH=$XDG_RUNTIME_DIR/pulse
#export SDL_AUDIODRIVER=alsa
#export SDL_AUDIODRIVER=pulseaudio

export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

# Disable DPMS and screen blanking 
xset -dpms
xset s off

xfwm4 --replace --daemon --compositor=off

exec steam -bigpicture

