#!/bin/bash
# Install language packs for BF-Commander
# Tim Yang <tdy@gmx.com>

. /usr/share/bfcommander/bflng.d/bflng.fn
[ "$1" == "-h" ] && help_exit
[ $# -ne 2 ] && usage_exit

JOB=$1
LNG=$2

case "$LNG" in
  de|hu|pl|pt|ru|sk|all) ;;
  *) usage_exit ;;
esac
case "$JOB" in
  -a) add_lng ;;
  -r) rm_lng ;;
  -h) help_exit ;;
  *)  usage_exit ;;
esac
exit 0
