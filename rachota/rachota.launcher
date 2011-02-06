#!/bin/bash

JAR_CMD='java -jar'
JAR_FLAGS="-userdir=$HOME/.rachota"
JAR_FILE=/usr/share/java/rachota/rachota.jar
LOG_FILE=/tmp/rachota.log

$JAR_CMD $JAR_FILE $JAR_FLAGS "$@" &> $LOG_FILE
exit $?
