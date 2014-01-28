#!/bin/sh

UNIONDIR=$(mktemp -d)

[[ ! -d ~/.ags/heroines-quest ]] && mkdir -p ~/.ags/heroines-quest

unionfs -o cow ~/.ags/heroines-quest=RW:/opt/ags/heroines-quest=RO $UNIONDIR

cd $UNIONDIR

ags

cd

sleep 1

fusermount -u $UNIONDIR

rmdir --ignore-fail-on-non-empty $UNIONDIR
