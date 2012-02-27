#!/usr/bin/env sh

if [ "`whoami`" != "root" ]
then
  echo "Must be ran as root"
  exit 1
fi

export TSUKIHIME_PATH="/usr/share/tsukihime-en/"
export DISC_PATH="none"

while [ "$DISC_PATH" = "none" ]
do
  printf "Enter Tsukihime disc mount-point: "
  read disc_path

  if ! [ -d "$disc_path" ]
  then
    echo "$disc_path does not exist"
    continue
  fi

  DISC_PATH="$disc_path"
  break
done

cp "$DISC_PATH/tsukihime/arc.sar" "$TSUKIHIME_PATH/"
