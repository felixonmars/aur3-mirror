#!/bin/sh

PCOMM=$(< /proc/$PPID/comm)

logger -t "${0##*/}" -- "legacy pm-utils command invoked by '$PCOMM' [$PPID]"

case ${0##*/} in
    pm-suspend)
        exec systemctl suspend;;
    pm-hibernate)
        exec systemctl hibernate;;
    pm-suspend-hybrid)
        exec systemctl hybrid-sleep;;
esac
