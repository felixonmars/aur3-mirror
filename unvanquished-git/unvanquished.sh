#! /bin/sh
cd /opt/unvanquished-git
exec ./unvanquished +set fs_libpath "$PWD" +set fs_basepath /var/lib/unvanquished "$@"
