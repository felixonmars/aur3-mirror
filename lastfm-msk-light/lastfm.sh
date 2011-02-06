#!/bin/sh

# Redirect debug output:
exec /usr/share/lastfm/last.fm "$@" 2>/dev/null
