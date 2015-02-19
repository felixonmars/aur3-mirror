#!/bin/sh

export LD_LIBRARY_PATH=/usr/share/meshmixer/lib
export LC_NUMERIC=en_US.UTF8 # http://meshmixer.com/forum/index.php?topic=2009.msg4796#msg4796

exec /usr/share/meshmixer/meshmixer "$@"
