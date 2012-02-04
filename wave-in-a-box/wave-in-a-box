#!/bin/bash

# This script will start the Wave in a Box server.
#

# Make sure the config file exists.
if [ ! -e /etc/wave-in-a-box/server.config ]; then
  echo "You need to copy server.config.example to server.config and edit it."
  exit 1
fi

# The version of Wave in a Box, extracted from the build.properties file
WAVEINABOX_VERSION=`sed "s/[\\t ]*=[\\t ]*/=/g" /usr/share/wave-in-a-box/build.properties | grep ^waveinabox.version= | cut -f2 -d=`

. /usr/share/wave-in-a-box/process-script-args.sh

exec java $DEBUG_FLAGS \
  -Dorg.eclipse.jetty.util.log.DEBUG=true \
  -Djava.security.auth.login.config=jaas.config \
  -Dwave.server.config=/etc/wave-in-a-box/server.config \
  -jar /usr/share/wave-in-a-box/waveinabox-server-$WAVEINABOX_VERSION.jar
