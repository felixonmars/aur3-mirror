#!/bin/bash
source /etc/profile.d/jboss-as.sh
source /etc/profile.d/jdk.sh

exec /usr/share/jboss-as/bin/$JBOSS_AS_MODE.sh

