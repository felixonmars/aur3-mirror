#!/bin/sh

kega_sharedir="/usr/share/kega-fusion"
kega_localdir="$HOME/.Kega Fusion"

# create local plugins directory if not present
if ! [ -d "${kega_localdir}/Plugins" ]; then
  mkdir -p "${kega_localdir}/Plugins"
fi

# create links for every included plugin
for i in ${kega_sharedir}/plugins/*; do
  ln -sf "$i" "${kega_localdir}/Plugins/$(basename "$i")"
done

# copy configuration file if not present
if ! [ -f "${kega_localdir}/Fusion.ini" ]; then
  cp ${kega_sharedir}/Fusion.ini "${kega_localdir}"
fi

# here we go!
${kega_sharedir}/kega-fusion "$@"
