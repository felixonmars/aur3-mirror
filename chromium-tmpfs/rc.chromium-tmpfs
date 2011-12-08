#!/bin/bash
#
#	/etc/rc.d/chromium-tmpfs
#
# Sync chromium preferences to tmpfs 
#
# An initial backup is always kept in ~/.config/chromium_ref
# In case of crash, chromium-tmpfs tries to recover your old profile at startup

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/chromium-tmpfs ] && . /etc/conf.d/chromium-tmpfs

# exit if $TMPFS does not exist
[ ! -z "$TMPFS" ] && [ ! -d "$TMPFS" ] && exit 1

# delete repeated users in configuration file
[ -n "$USERS" ] && USERS=`echo $USERS | tr " " "\n" | uniq`

# set defaults
[ -z "$TMPFS" ] && TMPFS=/dev/shm
[ -z "$USERS" ] && USERS="`ls -d -c1 /home/*/.config/chromium | cut -d/ -f3`"


case "$1" in
  start)
    stat_busy "Sync chromium profiles from hd to tmpfs"

    for user in $USERS ; do
      HOME=/home/$user
      VOLATILE=$TMPFS/$user.chromium

      [ ! -d $HOME/.config/chromium/cache ] && mkdir $HOME/.config/chromium/cache  \
        && chown $user:`grep $user /etc/passwd|cut -d':' -f4` $HOME/.config/chromium/cache
      [ ! -h $HOME/.cache/chromium ] && rm -r $HOME/.cache/chromium \
          && ln -s $HOME/.config/chromium/cache $HOME/.cache/chromium

      # run again
      if [ -h $HOME/.config/chromium ] && [ -d $HOME/.config/chromium_ref ] ; then
        # In case of crash, if old symlinks to $TMPFS still exists, use the old profile
        rm $HOME/.config/chromium
        mv $HOME/.config/chromium_ref $HOME/.config/chromium
      fi

      # first time
      if [ -d $HOME/.config/chromium ] && [ ! -d $HOME/.config/chromium_ref ] ; then
        # Create a directory in $TMPFS, symlink it with ~/.config/chromium
        mkdir -p $VOLATILE

        mv $HOME/.config/chromium $HOME/.config/chromium_ref

        ln -s $VOLATILE $HOME/.config/chromium

        # sync chromium directory to tmpfs
        rsync -a -q --exclude='/cache/*' $HOME/.config/chromium_ref/ $HOME/.config/chromium/
      fi
    done

    add_daemon chromium-tmpfs
    stat_done

    ;;
  stop)
    stat_busy "Sync chromium profiles from tmpfs to hd"

    for user in $USERS ; do
      HOME=/home/$user

      if [ -h $HOME/.config/chromium ] && [ -d $HOME/.config/chromium_ref ] ; then
        rsync -a -q --delete --exclude='/cache/*' $HOME/.config/chromium/ $HOME/.config/chromium_ref/
        rm $HOME/.config/chromium
        mv $HOME/.config/chromium_ref $HOME/.config/chromium
      fi
    done

    rm_daemon chromium-tmpfs
    stat_done

    ;;
  restart)
    $0 stop
    $0 start
    ;;
  save)
    stat_busy "Sync chromium profiles from tmpfs to hd"

    for user in $USERS ; do
      HOME=/home/$user

      if [ -h $HOME/.config/chromium ] && [ -d $HOME/.config/chromium_ref ] ; then
        rsync -a -q --delete --exclude='/cache/*' $HOME/.config/chromium/ $HOME/.config/chromium_ref/
      fi

    done

    stat_done
    ;;
  *)
    echo "usage: $0 {start|stop|restart|save}"
esac
exit 0

# vim:set ts=2 sw=2 ft=sh et:
