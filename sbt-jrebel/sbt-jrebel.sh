#!/usr/bin/env bash
#
# A simple wrapper for the sbt script created by
# Paul Phillips <paulp@typesafe.com> that enables JRebel Java Agent.
#
# Author: Augusto Rocha Elesbão <aelesbao@gmail.com>

help() {
  echo "JREBEL_PATH not found or not defined."
  exit
}

[[ -n "$JREBEL_PATH" ]] && [[ -f $JREBEL_PATH ]] || help

SBT_OPTS="${SBT_OPTS} -javaagent:${JREBEL_PATH}" sbt -J-XX:+CMSClassUnloadingEnabled $@

