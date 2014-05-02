#!/bin/bash -e

[[ $EUID -ne 0 ]] && echo Must be called as root! && exit 1

#CPU count = Zram devices count
cpu_count=$(grep -c ^processor /proc/cpuinfo)
ram_size=`grep MemTotal: /proc/meminfo | awk '{print $2}'`

config_manage() {
    run_backup=/run/systemd/swap/swap.conf
    config=/etc/systemd-swap.conf
    case $1 in
        start)
            # Backup config
            if [ ! -f "$run_backup" ]; then
                if [ -f /etc/systemd-swap.conf ]; then
                      mkdir -p /run/systemd/swap/
                      cp $config "$run_backup"
                else
                      echo "Config $config deleted, reinstall package"
                      exit 1
                fi
            fi
            source "$run_backup"
        ;;

        stop) rm "$run_backup" ;;
    esac
}

# Check if function already be called
started(){
    if [ -f "/run/systemd/swap/$1" ]; then
        return 1
    else
        return 0
    fi
}

# ZRam part
test_zram(){
    if [ -z "$zram_size" ]; then
        echo zram disabled
        return 1
    else
        return 0
    fi
}

create_zram(){
    modprobe zram num_devices=$cpu_count
    size=$(($zram_size/$cpu_count))
    cpu_count=$(($cpu_count-1))
    for n in `seq 0 $cpu_count`
    do
        echo ${size}K > /sys/block/zram$n/disksize
        mkswap /dev/zram$n
        swapon -p 32000 /dev/zram$n
        echo "$n" >> /run/systemd/swap/zram
    done
}

deatach_zram(){
    for n in `cat /run/systemd/swap/zram`
    do
        swapoff /dev/zram$n
        echo 1 > /sys/block/zram$n/reset
    done
    modprobe -r zram
    rm /run/systemd/swap/zram
}

test_swapf(){
    modprobe loop
    if [[ "$swapf_parse_fstab" == "1" ]]; then
        # search swap lines
        swap_string="$(grep swap /etc/fstab)"
        # check, swap lines commented?
        swap_string_not_commented="$(echo $swap_string | grep '#')"
        # if line exist and not commented - disable swapf
        if [ -z "$swap_string_not_commented" ] && [ ! -z "$swap_string" ]; then
            echo swap exist in fstab
            return 1
        fi
    fi
    if [ -z "$swapf_size" ] || [ -z "$swapf_path" ]; then
        echo swap file disabled
        return 1
    fi
    touch "$swapf_path" &> /dev/null || {
            echo Path $swapf_path wrong
            return 1
        }
}

create_swapf(){
    truncate -s $swapf_size $swapf_path
    chmod 0600 $swapf_path
    mkswap $swapf_path
    loopdev=$(losetup -f)
    losetup $loopdev $swapf_path
    swapon $loopdev
    echo $loopdev >> /run/systemd/swap/swapf
}

deatach_swapf(){
    for loopdev in `cat /run/systemd/swap/swapf`
    do
        swapoff $loopdev
        losetup -d $loopdev
    done
    rm $swapf_path /run/systemd/swap/swapf
}

set_swappiness(){
    if [ ! -z "$swappiness" ]; then
        sysctl vm.swappiness=$swappiness
    else
        return 0
    fi
}

case $1 in
    start)
        config_manage start
        started zram  && test_zram  && create_zram
        started swapf && test_swapf && create_swapf
        set_swappiness
    ;;

    stop)
        config_manage start
        started zram  || deatach_zram
        started swapf || deatach_swapf
        config_manage stop
    ;;
esac