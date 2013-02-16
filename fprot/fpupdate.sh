#!/bin/sh
# workaround for convenient /usr/bin access
# symlinking fails because it tries to find license/product info in /usr/bin

/usr/share/fprot/fpupdate "$@"
