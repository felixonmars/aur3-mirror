#!/bin/sh

# Use cdgc by default, but allow overriding
D_GC=${D_GC:-cdgc}

# Compile in 64-bit by default
ARCH=${ARCH:-64}

# Handle cleanup of object files when exiting (interrupted or not)

cleanup()
{
 echo "Cleaning object files"
 rm -f *.o
}

on_exit()
{
 cleanup
}

sig_handler()
{
 cleanup
 exit 1
}

trap on_exit 0 # executed at program exit
trap sig_handler INT TERM


# Detect the # of CPUs to see if parallel compilation should be used

CPUs=`grep -c '^processor' /proc/cpuinfo`

[ "$CPUs" -gt 1 ] &&
 echo "[ $CPUs CPUs detected, compiling release and debug in parallel ]"


# Compile both Tango release and debug versions

common_flags="-O -d-version=WithDateTime -d-version=CDGC -release -L-ldl"
# Always leave a space before the specific options
release_flags=
debug_flags=" -gc"

mkdir -p lib$ARCH

echo "Building runtime+user library in release mode ($ARCH bits): libtango-ldc-$D_GC.a"
build/bin/linux32/bob -u -m=$ARCH -r=ldc -c=ldc -g=$D_GC -o="$common_flags$release_flags" -l=lib$ARCH/libtango-ldc-$D_GC -p=linux . &
pid=$!

# Wait for this compilation if not running in parallel
[ "$CPUs" -lt 2 ] &&
 wait $pid

echo "Building runtime+user library with debug symbols ($ARCH bits): libtango-ldc-$D_GC-dbg.a"
build/bin/linux32/bob -u -m=$ARCH -r=ldc -c=ldc -g=$D_GC -o="$common_flags$debug_flags" -l=lib$ARCH/libtango-ldc-$D_GC-dbg -p=linux .

# Wait for the background compilation if running in parallel
[ "$CPUs" -gt 1 ] &&
 wait $pid
