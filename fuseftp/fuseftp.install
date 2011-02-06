#!/bin/sh

post_install() {
  modprobe fuse
  echo ">>> Add 'fuse' at the array MODULES in /etc/rc.conf"
}

op=$1
shift
[ "$(type -t "$op")" = "function" ] && $op "$@"
