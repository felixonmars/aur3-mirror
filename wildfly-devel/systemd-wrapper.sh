#!/bin/bash
source /etc/profile.d/wildfly-devel.sh
source /etc/profile.d/jdk.sh

exec /usr/share/wildfly-devel/bin/$WILDFLY_MODE.sh "$@"

