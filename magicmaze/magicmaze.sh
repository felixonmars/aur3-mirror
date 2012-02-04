#!/bin/sh

mkdir -p $HOME/.magicmaze

cd /usr/share/magicmaze
exec ./mm.rb "$@" -D $HOME/.magicmaze
