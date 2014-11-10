#!/usr/bin/env bash
# This script to be replaced by scripts/disunity.sh
BASEDIR="$( cd "$( dirname "$( readlink -f ${BASH_SOURCE[0]} )" )" && pwd )"
java -jar "$BASEDIR/disunity.jar" "$@"
