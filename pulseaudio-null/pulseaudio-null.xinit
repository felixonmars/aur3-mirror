#!/bin/bash

case "$DESKTOP_SESSION" in
  gnome|xfce*) # PulseAudio is started via XDG Autostart
  ;;
  *)
    # Extra checks in case DESKTOP_SESSION is not set correctly
    if [[ -z $GNOME_DESKTOP_SESSION_ID ]]; then
      /usr/bin/start-pulseaudio-x11
    fi
  ;;
esac
