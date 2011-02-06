#!/bin/sh

CP=/usr/share/java/rmconverter/rmconverter.jar
CP=$CP:/usr/share/java/rmconverter/log4j.jar

cd /usr/share/rmconverter
java -cp $CP net.dudesblog.rmc.start.Launcher
