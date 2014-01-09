#!/bin/sh
# adjust the following to your configuration
CHDKPTP_DIR=/usr/share/chdkptp-svn
# only need if you have compiled IUP support and have NOT installed the libraries to system directories.
#export LD_LIBRARY_PATH=/path/to/iup:/path/to/cd
export LUA_PATH="$CHDKPTP_DIR/lua/?.lua"
"$CHDKPTP_DIR/chdkptp" "$@"