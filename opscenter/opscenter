#!/bin/bash

PIDFILE="/var/run/opscenter.pid"
TWISTD_EXTRA=""

# Parse any command line options.

args=`getopt f "$@"`
eval set -- "$args"

while true; do
    case "$1" in
        -f)
            export OPSCENTERD_LOG_STDOUT=1
            TWISTD_EXTRA="$TWISTD_EXTRA -n"
            shift
        ;;
        -p)
            shift
            PIDFILE=$1
            shift
        ;;
        --)
            shift
            break
        ;;
        *)
            echo "Invalid argument." >&2
            exit 1
        ;;
    esac
done

[ -d /var/run/opscenter ] || mkdir /var/run/opscenter
#[ -d /usr/share/opscenter/tmp ] || mkdir /usr/share/opscenter/tmp

# environment variables: $PIDFILE, $OPSCENTERD_USER, $OPSCENTERD_CONFIG_DIR, $HOME   See /etc/conf.d/opscenter

if [ "x$OPSCENTERD_USER" = "x" ]; then
    export OPSCENTERD_USER="opscenter"
fi

MYUID=$(id -u "$OPSCENTERD_USER")
MYGID=$(id -g "$OPSCENTERD_USER")
TWISTD_EXTRA="$TWISTD_EXTRA -u $MYUID -g $MYGID --pidfile $PIDFILE"

if [ "x$OPSCENTERD_HOME" = "x" ]; then
    OPSCENTERD_HOME=$(getent passwd $MYUID | cut -d ':' -f 6)
fi
export HOME=$OPSCENTERD_HOME
cd "$HOME"

if [ $(uname -m) = "x86_64" ]; then
    PY_ARCH="amd64"
else
    PY_ARCH="i386"
fi

# we support python2.5-2.7
PYVERSIONS="2.5 2.6 2.7"

[ -z "$PYTHON" ] && \
for i in $PYVERSIONS; do
    which python$i > /dev/null 2>&1 && PYTHON=$(which python$i)
done
[ -n "$PYTHON" ] || {
    echo "No python interpreter found. Abort." >&2
    exit 3
}

PY_VER=$($PYTHON -c "import platform; v = platform.python_version(); print v[:v.index('.', 2)]")

export PYTHONPATH="/usr/lib/python${PY_VER}/site-packages:./lib/py:./lib/py-unpure:${PYTHONPATH}"

if [ "x$OPSCENTERD_CONFIG_DIR" = "x" ]; then
    export OPSCENTERD_CONFIG_DIR="/etc/opscenter"
fi
[ -n "$OPSCENTERD_CONFIG_DIR" ] || {
    echo "Could not find OpsCenter config dir." >&2
    exit 4
}

if [ "x$OPSCENTERD_LOG_DIR" = "x" ]; then
    export OPSCENTERD_LOG_DIR='/var/log/opscenter'
fi

if [ "x$OPSCENTERD_TMP_DIR" = "x" ]; then
    export OPSCENTERD_TMP_DIR='/tmp'
fi

TWISTD="bin/twistd"

"$PYTHON" $TWISTD $TWISTD_EXTRA -oy bin/start_opscenter.py
