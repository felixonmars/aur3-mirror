#!/bin/sh
cd /var/lib/openbazaar/
export PYTHONPATH=/var/lib/openbazaar:/usr/lib/python2.7/site-packages/
python2 -m node.openbazaar stop
