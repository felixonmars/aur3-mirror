#!/bin/sh
for name in /usr/share/java/yComp/*.jar ; do
  CP=$CP:$name
done
java -cp "$CP" -jar "/usr/share/java/yComp/yComp.jar" "$@"

