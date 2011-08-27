#!/bin/sh
#
# Runs pegdowm - a command line interface to pegdown.
#

exec "$JAVA_HOME/bin/java" $JAVA_OPTS -jar /usr/share/java/pegdown-cli/pegdown-cli.jar "$@"
