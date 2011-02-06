#!/bin/sh

##
# This script will set libmatthew-java classpath variables.
##

LIBMATTHEW_HOME=/usr/share/java/libmatthew
LIBMATTHEW_CLASSPATH=${LIBMATTHEW_HOME}/unix.jar:${LIBMATTHEW_HOME}/debug-disable.jar:${LIBMATTHEW_HOME}/hexdump.jar:${LIBMATTHEW_HOME}/dbus.jar:${LIBMATTHEW_HOME}/dbus-bin.jar
LIBMATTHEW_DEBUG_CLASSPATH=${LIBMATTHEW_CLASSPATH}/unix.jar:${LIBMATTHEW_PATH}/debug-enable.jar:${LIBMATTHEW_PATH}/hexdump.jar:${LIBMATTHEW_PATH}/dbus.jar:${LIBMATTHEW_PATH}/dbus-bin.jar

