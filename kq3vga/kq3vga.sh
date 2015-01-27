#!/bin/sh

UNIONDIR=$(mktemp -d)

[[ ! -d ~/.ags/kq3vga ]] && mkdir -p ~/.ags/kq3vga

unionfs -o cow ~/.ags/kq3vga=RW:/opt/ags/kq3vga=RO $UNIONDIR

cd $UNIONDIR

ags

cd

sleep 1

fusermount -u $UNIONDIR

rmdir --ignore-fail-on-non-empty $UNIONDIR
