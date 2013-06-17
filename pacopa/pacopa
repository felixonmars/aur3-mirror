#!/bin/sh
 
(
num=2
args=$(getopt n: "$@")
eval set -- "$args"
while true; do
  case "$1" in
  -n) num=$2; shift 2;;
  --) shift; break;;
  esac
done
 
cd "${1:-/var/cache/pacman/pkg}" && \
dir=$(pwd -P) && \
ls -1 *pkg* 2>/dev/null | sed -r 's/^(.*)-((.*)-){2}.*/\1/' | sort -u |\
while read p; do
  ls -1tr $p* |\
  while read f; do
    [ ! -d "$p" ] && [ -z "$(echo ${f#$p} | cut -d- -f5)" ] && echo "$dir/$f"
  done | head -n -$num
done | sort -u
)

