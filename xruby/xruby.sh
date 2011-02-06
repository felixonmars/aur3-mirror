#!/bin/sh
if [ $# -lt 1 ]; then
  java -jar /opt/xruby/xruby.jar -h
  exit 0
fi
java -jar /opt/xruby/xruby.jar $*
