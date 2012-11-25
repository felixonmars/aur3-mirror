#!/bin/sh
DAVMAIL_HOME=/usr/share/java/davmail
for name in $DAVMAIL_HOME/lib/*.jar; do
  CP=$CP:$name
done
CP=$CP:$DAVMAIL_HOME/davmail.jar
"$JAVA_HOME/bin/java" -cp $CP davmail.DavGateway $1
exit $?
