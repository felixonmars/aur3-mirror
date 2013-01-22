#!/bin/bash

source /etc/conf.d/magic-motd.conf

LOAD_PLUGINS=${PLUGINS:-cpu arch kernel ram ip}

WRITE=0
OUTPUT=""
DEST=/etc/motd

generate_motd() {
  for plugin in ${LOAD_PLUGINS}; do
    local full=/etc/magic-motd.d/${plugin}
    if [ -e ${full} ]; then
      OUTPUT="$OUTPUT$(${full})\n"
    fi
  done

  if [ ${WRITE} -eq 1 ]; then
    echo -e "${OUTPUT}" > ${DEST}
  else
    echo -e "${OUTPUT}"
  fi
}

while test $# != 0; do
  case "$1" in
    -w) WRITE=1
  esac
  shift
done

generate_motd

# vim:set ts=2 sw=2 ft=sh et:
