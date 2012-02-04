#!/bin/sh

test -x /usr/sbin/netenv || exit 0

case "$1" in
    start | restart | force-reload | reload)
                /usr/sbin/netenv
                ;;
    stop)
                ;;
*)
                echo "Usage: $0 {start|stop|restart|reload|force-reload}"
                exit 1
                ;;
esac
