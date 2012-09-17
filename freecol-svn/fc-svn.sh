#!/bin/bash

FC_PATH=/usr/share/java/freecol-svn
LOG_PATH=/tmp/freecol-svn

[ ! -d "$LOG_PATH" ] && install -dm755 $LOG_PATH
cd $LOG_PATH
java -Xmx512M -jar $FC_PATH/FreeCol.jar "$@" --freecol-data $FC_PATH/data \
  &> ./messages.log
