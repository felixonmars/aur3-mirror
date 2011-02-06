#!/bin/sh


fplugins="$HOME/.FRD/plugins"

if [ ! -d "$fplugins" ]
then
  mkdir -p "$fplugins" || exit 1
  cp /usr/share/freerapid/plugins/*.frp "$fplugins" || exit 1
fi


exec java -Dplug-dir="$fplugins" -jar /usr/share/freerapid/frd.jar "$@"
