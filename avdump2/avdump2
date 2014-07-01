#!/bin/bash

AVDUMP2_HOME=/usr/share/avdump2

export LD_LIBRARY_PATH=${AVDUMP2_HOME}

# If libMediaInfo still can't be found, uncomment this.
#export MONO_PATH=${AVDUMP2_HOME}

# Make sure that the locale uses UTF-8 encoding.
# Remove this if your file system actually uses something else.
shopt -s extglob
if [ -z "$LC_ALL" ]; then
  LC_ALL="$LANG"
fi
if [ "$LC_ALL" == "${LC_ALL%[Uu][Tt][Ff]?(-)8}" ]; then
  LC_ALL=en_US.UTF-8
fi
export LC_ALL
export LANG="$LC_ALL"

if ! mono ${AVDUMP2_HOME}/AVDump2CL.exe "$@" ; then
  echo
  setterm -cursor on
fi
