#!/bin/bash

if [[ "$0" =~ / ]]; then
  read path < <(realpath -- "$0")
else
  if hash "$0" &> /dev/null; then
    read path < <(hash -t "$0")
  else
    if [ -f "./$0" ]; then
      read path < <(realpath -- "./$0")
    fi
  fi
fi

if [ -z "$path" ]; then
  path=/usr/bin
else
  read path < <(dirname -- "$path")
fi

exec -- java -jar "$path/../lib/daydreamer/DayDreamer7.0.jar" "$@"
