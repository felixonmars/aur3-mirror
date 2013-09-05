#!/bin/bash
source /etc/profile.d/wildfly.sh
source /etc/profile.d/jdk.sh

exec /usr/share/wildfly/bin/$WILDFLY_MODE.sh "$@"

