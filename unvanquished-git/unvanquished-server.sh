#! /bin/sh
cd /var/lib/unvanquished-server
exec /opt/unvanquished-git/unvanquishedded +set fs_libpath /opt/unvanquished-git +set fs_basepath /opt/unvanquished-git +exec server.cfg "$@"
