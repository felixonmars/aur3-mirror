#!/bin/sh

case $1/$2 in
  pre/*)
    echo "Going to $2..."
    modprobe -r alx
    ;;
  post/*)
    echo "Waking up from $2..."
    modprobe alx
    ;;
esac