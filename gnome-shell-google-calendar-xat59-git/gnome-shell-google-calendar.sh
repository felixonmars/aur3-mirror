#!/bin/bash
# GNOME Shell Google Calendar requires a network connection so don't start until
# it has been detected.

while true; do
  if [[ $(ping -q -w 1 -c 1 google.com) ]]; then
    /usr/share/gnome-shell-google-calendar/gnome-shell-google-calendar.py
    break
  else
    sleep 4
  fi
done

