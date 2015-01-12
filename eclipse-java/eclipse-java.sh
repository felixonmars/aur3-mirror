#!/bin/bash

export ECLIPSE_HOME=/usr/share/eclipse-java
export GDK_NATIVE_WINDOWS=true
${ECLIPSE_HOME}/eclipse "$@"
