#!/bin/sh
# workaround for convenient /usr/bin access
# symlinking fails because it tries to find virus definitions in /usr/bin

/usr/share/fprot/fpscan "$@"
