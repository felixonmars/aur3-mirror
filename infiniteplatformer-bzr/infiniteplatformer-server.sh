#!/bin/sh

cd "/opt/Infinite8BitPlatformer/"

python2 Infinite8BitPlatformerServer.py "${@}"

cd - >/dev/null

# vim:ts=4:sw=4:et
