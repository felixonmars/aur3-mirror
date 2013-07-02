#!/bin/sh

ECLIPSE_HOME=/usr/share/eclipse
GDK_NATIVE_WINDOWS=true
export ECLIPSE_HOME
export GDK_NATIVE_WINDOWS
${ECLIPSE_HOME}/eclipse "$@"

