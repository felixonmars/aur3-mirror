#!/bin/sh
if [[ -z "$SBT_OPTS" ]]; then
  SBT_OPTS="-Xms512m -Xmx1024m -XX:ReservedCodeCacheSize=64m -XX:MaxPermSize=256m -Xss2m -XX:+CMSClassUnloadingEnabled -Dfile.encoding=UTF-8"
fi
"$JAVA_HOME/bin/java" $SBT_OPTS -jar /usr/share/java/sbt-launch.jar "$@"
