#!/bin/bash

export SONGBIRDDIR="/opt/songbird"
#export LD_LIBRARY_PATH=${SONGBIRDDIR}:${LD_LIBRARY_PATH}
export PREVIOUSPATH="${PATH}"
export PATH="${SONGBIRDDIR}:${PATH}"
cd -- "${SONGBIRDDIR}"
"${SONGBIRDDIR}"/songbird $@
