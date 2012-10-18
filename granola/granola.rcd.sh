#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_name=granola
. /etc/conf.d/$daemon_name.conf

freq_dir=/sys/devices/system/cpu/cpu0/cpufreq

# modded from source
test_usable_dvfs() {
    grep userspace $freq_dir/scaling_available_governors >& /dev/null
    return $?
}

#modded from source
insert_cpufreq_modules() {
    if [[ ! -d $freq_dir/scaling_driver ]]; then
        # No driver yet, try and modprobe one
        module_dir="/lib/modules/$(uname -r)/kernel/drivers/cpufreq/"
        for module in $(ls $module_dir 2> /dev/null | cut -d '.' -f 1); do
            [ modprobe $module 2> /dev/null ] && break
        done
    # Either no driver or it is compiled in
    fi
    [ ! grep userspace $freq_dir/scaling_available_governors >& /dev/null ] && modprobe cpufreq-userspace 2> /dev/null
    test_usable_dvfs
}

PID=$(get_pid $daemon_name)

case "$1" in
    start)
        stat_busy "Starting $daemon_name"
        if [[ -z "$PID" ]]; then
            [[ test_usable_dvfs ]] || insert_cpufreq_modules
            $daemon_name $granola_args
            if [[ $? == 0 ]]; then
                echo $(get_pid $daemon_name) > /run/$daemon_name.pid
                add_daemon $daemon_name
                stat_done
            else
                stat_fail
                exit 1
            fi
        fi
        ;;

    stop)
        stat_busy "Stopping $daemon_name"
        [[ ! -z "$PID" ]] && kill $PID &> /dev/null
        if [[ $? == 0 ]]; then
            rm -f /run/$daemon_name.pid &> /dev/null
            rm_daemon $daemon_name
            stat_done
        else
            stat_fail
            exit 1
        fi
        ;;

    restart)
        $0 stop
        sleep 1
        $0 start
        ;;

    status)
        stat_busy "Checking $daemon_name status"
        ck_status $daemon_name
        ;;

    *)
        echo "usage: $0 {start|stop|restart|status}"
esac
