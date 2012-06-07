#!/bin/sh

for jar in /usr/share/java/jregexanalyser/*.jar; do
  CP=$CP:$jar
done

java -cp $CP -Dawt.useSystemAAFontSettings=on -Xms32m -Xmx256M -Xincgcc com.schwebke.jregexanalyser.Main
