#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/cgconfig

# From cgconfig init.d script
create_default_groups() {
        declare defaultcgroup

        if [ -f /etc/cgrules.conf ]
        then
            read user ctrl defaultcgroup <<< \
                $(grep -m1 ^\* /etc/cgrules.conf)
            if [[ -n $defaultcgroup && $defaultcgroup = "*" ]]
            then
                defaultcgroup=
            fi
        fi

        if [ -z $defaultcgroup ]
        then
            defaultcgroup=sysdefault/
        fi

        #
        # Find all mounted subsystems and create comma-separated list
        # of controllers.
        #
        controllers=$(lssubsys 2>/dev/null | tr '\n' ',' | sed s/.$//)

        #
        # Create the default group, ignore errors when the default group
        # already exists.
        #
        cgcreate -g $controllers:$defaultcgroup 2>/dev/null

        #
        # special rule for cpusets
        #
        if echo $controllers | grep -q -w cpuset; then
                cpus=$(cgget -nv -r cpuset.cpus /)
                cgset -r cpuset.cpus=$cpus $defaultcgroup
                mems=$(cgget -nv -r cpuset.mems /)
                cgset -r cpuset.mems=$mems $defaultcgroup
        fi

        #
        # special rule for cpus
        #
        if echo $controllers | grep -q -w cpu; then
                rt_runtime_us=$(cgget -nv -r cpu.rt_runtime_us /)
                cgset -r cpu.rt_runtime_us=$rt_runtime_us $defaultcgroup
        fi

        #
        # Classify everything to default cgroup. Ignore errors, some processes
        # may exit after ps is run and before cgclassify moves them.
        #
        cgclassify -g $controllers:$defaultcgroup $(ps --no-headers -eL o tid) \
                 2>/dev/null || :
}

case "$1" in
  start)
    stat_busy "Starting CGroups configuration"
    /usr/sbin/cgconfigparser -l /etc/cgconfig.conf
    if [ $? -gt 0 ]; then
      stat_fail
    else
      if [ $CREATE_DEFAULT == "yes" ]; then
        create_default_groups
      fi
      add_daemon cgconfig
      stat_done
    fi
    ;;
  stop)
    stat_busy "Clearing CGroups configuration"
    cgclear
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon cgconfig
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

# vim:set ft=sh:
