#!/bin/sh

STATUS=$1

# Chrony set-up
CHRONY=/usr/bin/chronyc
CONFIG=/etc/chrony.conf
KEYFILE=`grep ^keyfile $CONFIG | sed 's/[^ ]* //' -`
COMMANDKEY=`grep ^commandkey $CONFIG | sed 's/[^ ]* //' -`
PASSWORD=`grep ^$COMMANDKEY $KEYFILE | sed 's/[^ ]* //' -`

chrony_cmd() {
	echo Chrony going $1.
	exec $CHRONY <<EOF
password $PASSWORD
$1
EOF
}

case "$STATUS" in
  up)
    chrony_cmd online
  ;;
  down)
    # Check for active interface, take offline if none is active
    chrony_cmd offline
  ;;
esac
