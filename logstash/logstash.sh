#!/bin/sh

[ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh
[ -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

if [ -x "$JAVA_HOME/bin/java" ]; then
    JAVA="$JAVA_HOME/bin/java"
else
    JAVA=`which java`
fi

export HOME="${LOGSTASH_HOME:-/var/lib/logstash}"
exec "$JAVA" -jar /usr/share/java/logstash.jar "$@"
