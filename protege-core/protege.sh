#!/bin/sh
for name in /usr/share/java/protege/*.jar ; do
  CP=$CP:$name
done
export PROTEGE_HOME=/usr/share/protege
exec java -cp $CP edu.stanford.smi.protege.Application
