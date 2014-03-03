#!/bin/sh

cd /opt/swaag
exec /bin/sudo -EHnu swaag -- ./swaag "$@"
