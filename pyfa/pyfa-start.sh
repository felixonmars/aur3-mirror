#!/bin/sh

# Download data files
[ -f /usr/share/pyfa/downloadData.py ] && python /usr/share/pyfa/downloadData.py

# Launch pyfa
python2 /usr/share/pyfa/launch.py
