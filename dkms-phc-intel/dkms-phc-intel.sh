#!/bin/bash

case "$1" in
  start)
  ;;
  stop)
    version="$(\ls -d /usr/src/linux-*-ARCH | tail -n 1)"
    dkms autoinstall -k "${version#*/linux-}"
  ;;
  *)
    echo "usage: $0 {start|stop}" >&2
  ;;
esac

# vim:set ts=2 sw=2 ft=sh et:
