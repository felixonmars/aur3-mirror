#!/bin/bash
set -e

if [ ! -d ~/.alienblaster ]; then
  mkdir -p ~/.alienblaster
  ln -s /usr/share/alienblaster/images ~/.alienblaster/images
  ln -s /usr/share/alienblaster/sound ~/.alienblaster/sound
  cp -r /usr/share/alienblaster/cfg ~/.alienblaster
fi

cd ~/.alienblaster
exec alienblaster.bin "$@"
