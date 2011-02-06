#!/bin/sh
SHARE=/usr/share/js-beautify
exec rhino $SHARE/beautify-cl.js -d "$SHARE" "$@"
