#!/bin/sh
for i in libreoffice openoffice.org{,-devel}; do
 if [ -e "/usr/lib/$i/basis-link/program/uno.py" ]; then
  export PYTHONPATH="$PYTHONPATH:/usr/lib/$i/basis-link/program/"
  break
 fi
done

/usr/bin/openlp.pyw $@
