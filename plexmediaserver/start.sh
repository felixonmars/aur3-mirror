#!/bin/sh
. /etc/conf.d/plexmediaserver

export PLEX_MEDIA_SERVER_HOME=${PLEX_MEDIA_SERVER_HOME}
export LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}"
export TMPDIR="${PLEX_MEDIA_SERVER_TMPDIR}"
ulimit -s ${PLEX_MEDIA_SERVER_MAX_STACK_SIZE}

touch /var/log/plexmediaserver.log
chown ${PLEX_MEDIA_SERVER_USER}:${PLEX_MEDIA_SERVER_USER} /var/log/plexmediaserver.log

su -c "/usr/lib/plexmediaserver/Plex\ Media\ Server 2>&1 >>/var/log/plexmediaserver.log &" ${PLEX_MEDIA_SERVER_USER}
