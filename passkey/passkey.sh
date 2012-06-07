#!/bin/sh

for jar in /usr/share/java/passkey/*.jar; do
  CP=$CP:$jar
done

java -cp $CP net.sourceforge.passkey.Main
