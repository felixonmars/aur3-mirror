#!/bin/bash
GOOGLEEARTH_DATA_PATH="/opt/google-earth"

LD_LIBRARY_PATH=.:${GOOGLEEARTH_DATA_PATH}:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

cd "${GOOGLEEARTH_DATA_PATH}/"

# Fix for languages that use "," instead of "." for separating thousands from hundreds in numbers
LANGUAGES_AFFECTED="de_DE it_IT"
SYSTEM_LANGUAGE=`echo ${LANG/.*}`
if [ `echo ${LANGUAGES_AFFECTED} | grep -c ${SYSTEM_LANGUAGE}` -gt 0 ]; then
	export LC_NUMERIC=en_US.UTF8
fi

exec "./googleearth-bin" $*