#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/vbox/vbox.cfg

case "$1" in
    setup)
        stat_busy "Unloading cloop kernel module"
        if grep -q "^cloop" /proc/modules; then
            modprobe -r cloop
        fi
        stat_done
        for p in /lib/modules/*; do
            if [ ! -d "$p/kernel" ]; then
                if [ -e "$p/misc/cloop.ko" ]; then
                    stat_busy "Removing old cloop kernel module from $p"
                    rm -f "$p/misc/cloop.ko" 2>/dev/null
                    rmdir -p --ignore-fail-on-non-empty "$p/misc/" 2>/dev/null
                    stat_done
                fi
            fi
        done
        if [ -e "/lib/modules/$(uname -r)/misc/cloop.ko" ]; then
            stat_busy "Removing old cloop kernel module"
            rm -f "/lib/modules/$(uname -r)/misc/cloop.ko" 2>/dev/null
            stat_done
        fi
        stat_busy "Recompiling cloop kernel module"
        rm -f /usr/src/cloop/{cloop.ko,cloop.mod.o,cloop.o,compressed_loop.o}
        make modules -C /usr/src/linux-$(uname -r)/ M=/usr/src/cloop >/dev/null 2>&1
        if [ ! -d "/lib/modules/$(uname -r)/misc" ]; then
            mkdir "/lib/modules/$(uname -r)/misc"
        fi
        install -m 664 /usr/src/cloop/cloop.ko "/lib/modules/$(uname -r)/misc"   
        stat_done
        ;;
    *)
        echo "usage: $0 {setup}"
        ;;
esac

