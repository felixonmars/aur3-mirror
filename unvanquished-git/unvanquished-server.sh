#! /bin/sh
cd /opt/unvanquished
exec ./unvanquishedded +set fs_libpath $PWD +set fs_basepath $PWD $@
