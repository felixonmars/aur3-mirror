#!/bin/sh
export __GL_THREADED_OPTIMIZATIONS=1

cd /opt/firestorm
exec ./casviewer $@
