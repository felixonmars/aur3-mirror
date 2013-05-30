#!/bin/bash
source /etc/profile.d/wildfly.sh
source /etc/profile.d/jdk.sh
exec /usr/share/wildfly/bin/$JBOSS_AS_MODE.sh "$@"

