#!/bin/bash

# Globals
CONFIG_FILE=/etc/fdnsc.conf
URL_BASE=https://freedns.afraid.org/dynamic/update.php
TEMP_FILE=/tmp/fdnsc-$$

# Defaults
DEFAULT_PID_FILE=/var/lib/fdnsc/pid
PID_FILE="$DEFAULT_PID_FILE"
DEFAULT_LOG_FILE=/var/log/fdnsc.log
LOG_FILE="$DEFAULT_LOG_FILE"
DEFAULT_LOG_LIMIT=7200
LOG_LIMIT="$DEFAULT_LOG_LIMIT"
DEFAULT_UPDATE_PERIOD=60
UPDATE_PERIOD="$DEFAULT_UPDATE_PERIOD"

# Read config file
. "$CONFIG_FILE"

usage() {
  cat << EOF
Usage: fdnsc [ACTION]

FDNSC is a freedns.afraid.org dynamic DNS update client.

FDNSC reads from "$CONFIG_FILE".  It is sourced as a regular Bash sript.

Required config variables:
UPDATE_HASH   - The hash from your direct update URL.  This is everything after
                the ?.  It can be found at https://freedns.afraid.org/dynamic.

Optional config variables:
PID_FILE      - The file to save the process id (default: "$DEFAULT_PID_FILE")
LOG_FILE      - The log file to write to (default: "$DEFAULT_LOG_FILE")
LOG_LIMIT     - The maximum number of lines in the log file before rotating
                (default: "$DEFAULT_LOG_LIMIT")
UPDATE_PERIOD - The update period in seconds (default: "$DEFAULT_UPDATE_PERIOD")
EOF
}

rotate_log() {
  if [ `wc -l "$LOG_FILE" | cut -d ' ' -f1` -gt $LOG_LIMIT ]; then
    [ -e "$LOG_FILE.old" ] && rm -f "$LOG_FILE.old"
    mv "$LOG_FILE" "$LOG_FILE.old"
  fi
}

# Check the requested action
action=start
[ $# -eq 1 ] && action="$1"
[ $# -gt 1 ] && usage && exit 1
[ "$action" != start -a "$action" != stop ] && usage && exit 1

if [ $action = start ]; then
  # Check if another process is running
  if [ -e "$PID_FILE" ]; then
    cat << EOF
$PID_FILE already exists.  Check if another process is running.
If not, delete $PID_FILE and restart FDNSC.
EOF
    exit 1
  fi

  # Make sure UPDATE_HASH is set
  [ -z "$UPDATE_HASH" ] && usage && exit 1

  # Store our PID
  mkdir -p `dirname "$PID_FILE"`
  echo $$ > "$PID_FILE"

  # Start updating
  while [ 1 ]; do
    rotate_log # rotate the log file if necessary
    wget -q -O "$TEMP_FILE" "$URL_BASE?$UPDATE_HASH"
    cat "$TEMP_FILE" >> "$LOG_FILE"
    rm "$TEMP_FILE"
    sleep "$UPDATE_PERIOD"
  done

else # action must be stop

  # Make sure another process is running
  if [ ! -e "$PID_FILE" ]; then
    echo "$PID_FILE does not exist.  Has FDNSC been started?"
    exit 1
  fi

  # Another process is running.  Grab its PID
  pid="`cat $PID_FILE`"

  # Kill it off
  kill "$pid"

  # Delete the PID file
  rm -f "$PID_FILE"

fi
