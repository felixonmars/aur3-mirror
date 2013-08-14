#!/bin/sh

PCOMM=$(< /proc/$PPID/comm)

#logger -t "${0##*/}" -- "legacy pm-utils command invoked by '$PCOMM' [$PPID]"

read_config() {
        awk -F= "\$1 == \"$1\" {print \$2}" /etc/systemd/sleep.conf 2>/dev/null
}

get_config() {
        { read_config "$1" || echo "$2"; } | tr "," "\n"
}

arg=${1#--}
arg=${arg//_/-}

case $arg in
    "")
        echo "Usage: pm-is-supported --{suspend|hibernate|suspend-hybrid}" >&2
        exit 2
        ;;
    suspend)
        state=$(get_config SuspendState 'mem,standby,freeze')
        disk=$(get_config SuspendMode '')
        ;;
    hibernate)
        state=$(get_config HibernateState 'disk')
        disk=$(get_config HibernateMode 'platform,shutdown')
        ;;
    suspend-hybrid)
        state=$(get_config HibernateState 'disk')
        disk=$(get_config HibernateMode 'suspend,platform,shutdown')
        ;;
    *)
        exit 1
        ;;
esac

fgrep -wqs "$state" /sys/power/state &&
fgrep -wqs "$disk" /sys/power/disk
