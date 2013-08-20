#!/bin/bash

function error() {
    command zenity  --error --text="$1" 2>/dev/null ||
    command kdialog --error "$1" 2>/dev/null ||
    echo "$1"
}


if [[ $EUID -eq 0 ]]; then
   echo "You should launch Dofus as a non-root user" 1>&2
   exit 1
fi

CURRENT_DIR=`dirname $(readlink -f -n "$0")`
TRANSITION=/opt/ankama/transition/transition
if [ ! -f $TRANSITION ];then
	TRANSITION=$(which transition) || $(which ankama-transition) || error "Transition is not installed on your system" && exit 1
fi

$TRANSITION --configuration_file=$CURRENT_DIR/transition.conf --application-id=ankama-dofus-transition &
