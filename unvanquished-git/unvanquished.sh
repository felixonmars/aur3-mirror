#! /bin/sh
cd /opt/unvanquished
exec ./unvanquished +set fs_libpath "$PWD" +set fs_basepath /var/lib/unvanquished "$@"
