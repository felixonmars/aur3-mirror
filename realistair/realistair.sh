#!/usr/bin/env sh
source /etc/profile
exec env python2 -OO "/usr/share/realistair/RE-alistair.py" --game /usr/share/realistair "$@"
