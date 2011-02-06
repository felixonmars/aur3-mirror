#!/bin/bash
  
  [ "${ICECATDIR}" = "" ] && export ICECATDIR="/usr/lib/icecat-3.0.1-g1"
  export LD_LIBRARY_PATH=${ICECATDIR}:${LD_LIBRARY_PATH}
  export MOZILLA_FIVE_HOME=${ICECATDIR}
  export MOZ_PLUGIN_PATH=${ICECATDIR}/plugins/:${MOZ_PLUGIN_PATH}
  export MOZ_DISABLE_GNOME=1
  [ "${GNOME_DESKTOP_SESSION_ID}" != "" ] && export MOZ_DISABLE_GNOME=0
  export PREVIOUSPATH=${PATH}
  export PATH=${ICECATDIR}:${PATH}
  cd ${ICECATDIR}
  ${ICECATDIR}/icecat $@
