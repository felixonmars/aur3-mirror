#!/bin/bash
#
# Inetd-wrapper for ZMS (Zoneminder Streaming Server)
#
# Version:      2007-09-27
# Author:       Kurt Zankl <kz@xon.uni.cc>
# Inspiration:  http://www.debian-administration.org/articles/371
# Requirements: bash, inetd
# License:      GNU General Public License, Version 2
#
# /etc/services:
#   zms-inetd       85/tcp   # Zoneminder ZMS inetd-wrapper
#
# /etc/inetd.conf:
#   zms-inetd       stream tcp nowait    www-data   /usr/local/bin/zms-inetd  zms-inetd
#
# ZM Options / Paths / Web path to zms streaming server:
#   ZM_PATH_ZMS = http://<server>:85/<anypath>
#

# configuration
ZMCONF="/etc/zm.conf"
CGIBIN="zms"

# error handler
function errormsg {
  echo "HTTP/1.0 500 Internal Server Error"
  echo "Content-Type: text/html"
  echo
  echo "<title>ERROR</title><h1>ERROR</h1>"
  echo -e "<pre>$1</""pre>"
  exit 1
}

# get request
read REQUEST
# skip headers
HEADER="nothing"; while [ "$HEADER" != $'\r' -a -n "$HEADER" ]; do read HEADER; done

# read ZM configuration
[ -r $ZMCONF ] || errormsg "Error reading Zoneminder configuration \"$ZMCONF\""
. $ZMCONF
ZMS="$ZM_PATH_CGI/$CGIBIN"
[ -x $ZMS ] || errormsg "Error finding ZMS executable \"$ZMS\""

# check request
[ -z "$REQUEST" ] && errormsg "Request is empty"

# split request
URL="${REQUEST#GET }"
URL="${URL% HTTP/*}"
QUERY="${URL#*\?}"
URL="${URL%%\?*}"

# check query
[ "$QUERY" == "$URL" ] && errormsg "Invalid query"

# execute ZMS
# (STDERR output is discarded as this confuses MPEG streaming clients)
export QUERY_STRING="$QUERY"
echo "HTTP/1.0 200 OK"
"$ZMS" 2>/dev/null
echo
exit 0
