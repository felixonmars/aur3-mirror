#!/bin/sh

if ! [ -d "$HOME/.Kega Fusion/Plugins" ]; then
  mkdir -p "$HOME/.Kega Fusion/Plugins"
fi

for i in /usr/lib/kega-fusion/plugins/*; do
  ln -sf "$i" "$HOME/.Kega Fusion/Plugins/$(basename "$i")"
done

if ! [ -f "$HOME/.Kega Fusion/Fusion.ini" ]; then
  cp /usr/share/kega-fusion/Fusion.ini "$HOME/.Kega Fusion"
fi

/usr/bin/kega-fusion.real $@
