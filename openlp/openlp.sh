#!/bin/sh
if [ -e "/usr/lib/openoffice/basis-link/program/" ]; then
 export PYTHONPATH="$PYTHONPATH:/usr/lib/openoffice/basis-link/program/"
elif [ -e "/usr/lib/libreoffice/basis3.3/program/" ]; then
 export PYTHONPATH="$PYTHONPATH:/usr/lib/libreoffice/basis3.3/program/"
fi

/usr/bin/openlp.pyw $@
