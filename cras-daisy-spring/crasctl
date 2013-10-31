#!/bin/sh

if [ $# -ne 1 ]; then
  echo "$(basename "$0"): Specify command..." >&2
  exit 1
fi

COMMAND="$1"

case "$COMMAND" in
  store)
      mkdir -p /var/lib/cras
      ( amixer get Master | grep "^  Mono" |
        sed "s/^.*Playback \([0-9]*\) .*$/\1/" ) > /var/lib/cras/volume
      ;;
  restore)
      cras_test_client --select_output 3:1
      cras_test_client --select_input 4:1
      if [ -e /var/lib/cras/volume ]; then
        VOLUME=`cat /var/lib/cras/volume`
        if [ -n "$VOLUME" ]; then
          amixer set Master "$VOLUME" > /dev/null
          amixer set Capture 80 > /dev/null
        fi
      fi
      ;;
  init)
      cras_test_client --select_output 3:1
      cras_test_client --select_input 4:1
      amixer set Master 80 > /dev/null
      amixer set Capture 80 > /dev/null
      ;;
  *)
      echo "$(basename "$0"): Unknown command '$1'..." >&2
      ;;
esac
