PLEX_MEDIA_SERVER_USER=root
PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver

# the number of plugins that can run at the same time
PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6

# ulimit -s $PLEX_MEDIA_SERVER_MAX_STACK_SIZE
PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000

# where the mediaserver should store the transcodes
PLEX_MEDIA_SERVER_TMPDIR=/tmp

# uncomment to set it to something else
PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="$(awk -F: -v v=${PLEX_MEDIA_SERVER_USER} '{if ($1==v) print $6}' /etc/passwd)/var/lib/plexmediaserver"
