#!/bin/sh
test $# -ge 2 || {
  echo "ipcdo: usage: ipcdo user prog" >&2
  exit 100;
}
user="${1-root}"
user=`id -u "$user"`
shift
exec /usr/bin/ipcclient -l0 /service/ipcexec/s /usr/bin/ipccommand "$user" "$@"
