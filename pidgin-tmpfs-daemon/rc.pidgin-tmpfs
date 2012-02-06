#!/bin/bash
#
#	/etc/rc.d/pidgin-tmpfs
#
# Sync purple preferences to tmpfs 
#
# An initial backup is always kept in ~/.purple_ref
# In case of crash, pidgin-tmpfs tries to recover your old profile at startup

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/pidgin-tmpfs ] && . /etc/conf.d/pidgin-tmpfs

# exit if $TMPFS does not exist
[ ! -z "$TMPFS" ] && [ ! -d "$TMPFS" ] && exit 1

# delete repeated users in configuration file
[ -n "$USERS" ] && USERS=`echo $USERS | tr " " "\n" | uniq`

# set defaults
[ -z "$TMPFS" ] && TMPFS=/dev/shm
[ -z "$USERS" ] && USERS="`ls -d -c1 /home/*/.purple | cut -d/ -f3`"

case "$1" in
  start)
    stat_busy "Sync pidgin profiles from hd to tmpfs"

    for user in $USERS ; do

      if [ -h /home/$user/.purple ] && [ -d /home/$user/.purple_ref ] ; then
      
        # In case of crash, if old symlinks to $TMPFS still exists, use the old profile

        rm /home/$user/.purple
        mv /home/$user/.purple_ref /home/$user/.purple

      fi

      if [ -d /home/$user/.purple ] && [ ! -d /home/$user/.purple_ref ] ; then

        # Create a directory in $TMPFS, symlink it with ~/.purple
        mkdir -p $TMPFS/$user.purple
        mv /home/$user/.purple /home/$user/.purple_ref

        ln -s $TMPFS/$user.purple /home/$user/.purple

        # sync purple directory to tmpfs
        rsync -a -q /home/$user/.purple_ref/ /home/$user/.purple/

      fi

    done

    add_daemon pidgin-tmpfs

    stat_done

    ;;
  stop)
    stat_busy "Sync pidgin profiles from tmpfs to hd"

    for user in $USERS ; do

      if [ -h /home/$user/.purple ] && [ -d /home/$user/.purple_ref ] ; then

        rsync -a -q --delete /home/$user/.purple/ /home/$user/.purple_ref/

        rm /home/$user/.purple
        mv /home/$user/.purple_ref /home/$user/.purple

      fi

    done

    rm_daemon pidgin-tmpfs
    stat_done
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  save)
    stat_busy "Sync pidgin profiles from tmpfs to hd"

    for user in $USERS ; do

      if [ -h /home/$user/.purple ] && [ -d /home/$user/.purple_ref ] ; then
        rsync -a -q --delete /home/$user/.purple/ /home/$user/.purple_ref/
      fi

    done

    stat_done
    ;;
  *)
    echo "usage: $0 {start|stop|restart|save}"
esac
exit 0

# vim:set ts=2 sw=2 ft=sh et:
