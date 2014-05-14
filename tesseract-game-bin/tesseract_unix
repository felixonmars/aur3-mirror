#!/bin/sh
# TESS_DATA should refer to the directory in which Tesseract data files are placed.
#TESS_DATA=~/tesseract
#TESS_DATA=/usr/local/tesseract
TESS_DATA=/usr/share/tesseract/

# TESS_BIN should refer to the directory in which Tesseract executable files are placed.
TESS_BIN=/usr/bin/

# TESS_OPTIONS contains any command line options you would like to start Tesseract with.
#TESS_OPTIONS=""
TESS_OPTIONS="-u${HOME}/.tesseract"

  cd ${TESS_DATA}
  #exec ${TESS_BIN}/${SYSTEM_NAME}${MACHINE_NAME}client ${TESS_OPTIONS} "$@"
   exec ${TESS_BIN}/client-tesseract ${TESS_OPTIONS} "$@"

