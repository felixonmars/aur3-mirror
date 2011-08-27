#!/bin/bash

cd /usr/share/java/ifreebudget
$JAVA_HOME/bin/java -classpath .:lib/*:fmbin.jar net.mjrz.fm.Main
exit $?
