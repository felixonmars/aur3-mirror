#!/bin/sh

UNIONDIR=$(mktemp -d)

[[ ! -d ~/.ags/kq1vga ]] && mkdir -p ~/.ags/kq1vga

unionfs -o cow ~/.ags/kq1vga=RW:/opt/ags/kq1vga=RO $UNIONDIR

cd $UNIONDIR

ags

cd

sleep 1

fusermount -u $UNIONDIR

rmdir --ignore-fail-on-non-empty $UNIONDIR
