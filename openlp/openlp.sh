if [ -e "/usr/lib/libreoffice/basis-link/program/uno.py" ]; then
 export PYTHONPATH="$PYTHONPATH:/usr/lib/libreoffice/basis-link/program/"
 export URE_BOOTSTRAP="file:///usr/lib/libreoffice/program/fundamentalrc"
fi
