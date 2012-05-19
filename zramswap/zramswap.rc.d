#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# get the number of CPUs
num_cpus=$(grep -c '^processor' /proc/cpuinfo)
# if something goes wrong, assume we have 1
[[ "$num_cpus" != 0 ]] || num_cpus=1

# set decremented number of CPUs
decr_num_cpus=$((num_cpus - 1))

case "$1" in
  start)
    stat_busy "Enabling zram-based swap"
    # get the amount of memory in the machine
    mem_total_kb=$(grep MemTotal /proc/meminfo | grep -E --only-matching '[[:digit:]]+')
    mem_total=$((mem_total_kb * 1024))

    # load dependency modules
    modprobe zram zram_num_devices=$num_cpus 2>/tmp/zramswap-$$.log || modprobe zram num_devices=$num_cpus 2>/tmp/zramswap-$$.log || (cat /tmp/zramswap-$$.log && rm -f /tmp/zramswap-$$.log)

    # initialize the devices
    for i in $(seq 0 $decr_num_cpus); do
      echo $((mem_total / num_cpus)) > /sys/block/zram$i/disksize
    done

    # Creating swap filesystems
    for i in $(seq 0 $decr_num_cpus); do
      mkswap /dev/zram$i
    done

    # Switch the swaps on
    for i in $(seq 0 $decr_num_cpus); do
      swapon -p 100 /dev/zram$i
    done

    stat_done
  ;;
  stop)
    stat_busy "Switching off zram-based swap"
    # Switching off swap
    for i in $(seq 0 $decr_num_cpus); do
      if [[ "$(grep /dev/zram$i /proc/swaps)" != "" ]]; then
        swapoff /dev/zram$i
      fi
    done

    rmmod zram
    stat_done
  ;;
  *)
      echo "usage: $0 {start|stop}"
esac

exit 0
