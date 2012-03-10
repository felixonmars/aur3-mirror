#!/usr/bin/env sh

if [ "`whoami`" != "root" ]
then
  echo "Must be ran as root"
  exit 1
fi

export KT_PATH="/usr/share/kagetsu-tohya-en/"
export DISC_PATH="none"

while [ "$DISC_PATH" = "none" ]
do
  printf "Enter Kagetsu Tohya disc mount-point: "
  read disc_path

  if ! [ -d "$disc_path" ]
  then
    echo "$disc_path does not exist"
    continue
  fi

  DISC_PATH="$disc_path"
  break
done

cp "$DISC_PATH/歌月十夜/arc.nsa" "$KT_PATH/"
