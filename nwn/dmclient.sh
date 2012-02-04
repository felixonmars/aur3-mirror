#! /bin/bash

if [ ! -f "/usr/lib/libnwn.sh" ]; then
  echo "Can't load /usr/lib/libnwn.sh" >&2
  exit 1
else
  . "/usr/lib/libnwn.sh"
fi

nwn.run nwn.exec ./dmclient "$@"
