#!/bin/bash
  export LD_BIND_NOW=1
  export SB_GST_SYSTEM=1
  export SONGBIRDDIR="/opt/songbird"
  #export LD_LIBRARY_PATH=${SONGBIRDDIR}:${LD_LIBRARY_PATH}
  export PREVIOUSPATH=${PATH}
  export PATH=${SONGBIRDDIR}:${PATH}
  cd ${SONGBIRDDIR}
  ${SONGBIRDDIR}/songbird $@
