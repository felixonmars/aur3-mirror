#!/bin/sh
test $# -ge 1 || {
  echo "ipcrun: usage: ipcrun prog" >&2
  exit 100;
}
exec /usr/bin/ipcclient -l0 /service/ipcexec/s /usr/bin/ipccommand 0 "$@"
