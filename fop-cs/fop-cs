#!/bin/sh
for name in /usr/share/java/fop/lib/*.jar ; do
  CP=$CP:$name
  done
#  In future releases use this to add dependencies
#  CP=$CP:/usr/share/java/dep1/dep1.jar

fop -c /usr/share/java/fop/conf/myfop.xconf $* || exit 1
exit 0

