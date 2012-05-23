#! /bin/sh
cd /var/lib/unvanquished-server
exec /opt/unvanquished/unvanquishedded +set fs_libpath /opt/unvanquished +set fs_basepath /opt/unvanquished +exec server.cfg "$@"
