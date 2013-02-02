#!/bin/bash

FC_PATH=/usr/share/java/freecol-git
LOG_PATH=/tmp/freecol-git

[ ! -d "$LOG_PATH" ] && install -dm755 $LOG_PATH
cd $LOG_PATH
java -Xmx2048M -jar $FC_PATH/FreeCol.jar "$@" --freecol-data $FC_PATH/data \
  &> ./messages.log
