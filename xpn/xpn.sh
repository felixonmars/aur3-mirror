#!/usr/bin/env sh

basedir=/usr/lib/xpn

# Too many parameters
if [ $# -gt 2 ]; then
    echo "$0: Too many parameters"
    exit 1
fi

# The standard case
if [ $# -eq 0 ]; then
    python2 $basedir/xpn.py --home_dir
    exit 0
fi

# Custom directory
if [ $# -eq 2 -a $1 = "-c" ]; then
    python2 $basedir/xpn.py -c $2
    exit 0
fi
test_string=`echo "$1" | grep "\-\-custom_dir"`
if [ $# -eq 1 -a -n "$test_string" ]; then
    python2 $basedir/xpn.py $1
    exit 0
fi

# if this point is reached, something has gone wrong
echo "$0: Wrong paramters. Look into the man page."
exit 1





