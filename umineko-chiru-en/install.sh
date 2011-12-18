#!/bin/bash

if [ "`whoami`" != "root" ]
then
  echo "Must be ran as root"
  exit 1
fi

export UMINEKO_PATH="/usr/games/umineko-chiru/"
export DISC_PATH="none"

while [ "$DISC_PATH" = "none" ]
do
  printf "Enter Umineko Chiru disc mount-point: "
  read disc_path

  if ! [ -d "$disc_path" ]
  then
    echo "$disc_path does not exist"
    continue
  fi

  DISC_PATH="$disc_path"
  break
done

for f in `ls "$DISC_PATH/fullsrc"`
do
  cp "$DISC_PATH/fullsrc/$f" "$UMINEKO_PATH"
done
for f in BGM BGM0 BGM2 BGM3 BGM4 movie ME screenshot SE sys_se
do
  cp -r "$DISC_PATH/$f" "$UMINEKO_PATH/"
done

# Install icon file.
install -D -m 644 "$DISC_PATH/umineko.ico" \
  /usr/share/pixmaps/umineko-chiru.ico

# vim:set ts=2 sw=2 et:
