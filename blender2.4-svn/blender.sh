#!/bin/sh
if [ ! -d ~/.blender ]; then
  mkdir ~/.blender
  cp -r /usr/share/blender/plugins ~/.blender/plugins
  cp -r /usr/share/blender/scripts ~/.blender/scripts
  cp /usr/share/blender/Blanguages ~/.blender/.Blanguages
  cp /usr/share/blender/bfont.ttf ~/.blender/.bfont.ttf
fi

/usr/share/blender/blender "$@"
