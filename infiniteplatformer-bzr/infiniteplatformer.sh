#!/bin/sh

# Help
if [ $# -lt 1 ]; then #{
cat <<EOF
Usage: `basename "$0"` <server_address> [<debug>]

server_address      - Address of the Infinite 8-bit Platformer server
EOF
exit 1
fi #}

cd "/opt/Infinite8BitPlatformer/"

python2 Infinite8BitPlatformer.py "${@}"

cd - >/dev/null

# vim:ts=4:sw=4:et
