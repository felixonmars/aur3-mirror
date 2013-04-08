#! /bin/sh
cd /opt/unvanquished
exec ./daemonded +set fs_libpath $PWD +set fs_basepath $PWD $@
