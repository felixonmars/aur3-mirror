#!/bin/bash

detectDE()
{
    if [ x"$KDE_FULL_SESSION" = x"true" ]; then DE=kde;
    elif [ x"$GNOME_DESKTOP_SESSION_ID" != x"" ]; then DE=gnome;
    elif xprop -root _DT_SAVE_MODE | grep ' = \"xfce4\"$' >/dev/null 2>&1; then DE=xfce;
    fi
}

detectDE

case $DE in
   gnome|xfce)
      gksudo $1
   ;;
   kde)
      kdesudo $1
   ;;
   *)
   echo "This app needs to be run as root"
   ;;
esac
