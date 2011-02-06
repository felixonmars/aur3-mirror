#!/bin/bash

# Syncs your monitorix rrd databases in virtual memory on/dev/shm/monitorix
# and uses rsync to keep it backed-up to your hdd. Why do this?  It minimizes 
# hdd usage. The main monitorix package depends on this script being located in
# /etc/cron.hourly so don't move it out or else /etc/rc.d/monitorix start won't
# run it (i.e. your databases won't get written to /dev/shm/monitorix on boot!
#
# Note that this script was adapted from one originally written by Pwd which you
# can find here http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs

STATIC=/var/lib/monitorix-backup
LINK=/var/lib/monitorix
VOLATILE=/dev/shm/monitorix-data

[[ -r $VOLATILE ]] || install -dm755 $VOLATILE

if [[ `readlink $LINK` != $VOLATILE ]]; then
  mv $LINK $STATIC
  ln -s $VOLATILE $LINK
fi

if [[ -e $LINK/.flagged ]]; then
  rsync -av --delete --exclude .flagged $LINK/ $STATIC/
else
  rsync -av $STATIC/ $LINK/
  touch $LINK/.flagged
fi
