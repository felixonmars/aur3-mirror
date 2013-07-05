#!/bin/sh

# Read optional config

if [ -f /etc/chrontel-wetab.conf ];then
	. /etc/chrontel-wetab.conf
fi

# If not set, determine X-access-environment from running Xorg

if [ -z "${DISPLAY}" ] || [ -z "${XAUTHORITY}" ];then
	pid=
	wait=15
	while [ ${wait} -gt 0 ] && [ -z "${pid}" ];do
		pid=$(pidof -s Xorg)
		case ${pid} in "")
			sleep 0.5
			wait=$(( wait - 1))
		;;*)
			wait=0
		;;esac
	done
	case ${pid} in "")
		echo "Cannot determine Xorg's PID in time. You may need to set DISPLAY and XAUTHORITY in /etc/systemd/system/crontel-wetab.service" >&2
	;;*)
		arg=
		IFS="
"
		for i in $(sed 's,\x00,\n,g' /proc/${pid}/cmdline);do
			case ${i} in -*)
				arg=${i}
			;;*)
				case ${arg} in "")
					case ${i} in *:*)
						export DISPLAY=${i}
					;;esac
				;;-auth)
					export XAUTHORITY=${i}
				;;esac
				arg=
			;;esac
		done
		unset IFS
	;;esac
fi

# Search for correct i2c-device, needs i2c_i801.ko and i2c_dev.ko loaded

dev=
for i in /sys/bus/i2c/devices/*/name;do
	case $(cat ${i}) in "SMBus I801"*)
		dev=${i%/*}
		dev=${dev##*/}
		dev="-d /dev/${dev}"
	;;esac
done

# Create directory used by ch7036_monitor to store a "forced_mute" file

if [ ! -d /var/run/chrontel ];then
	mkdir /var/run/chrontel
fi

# Run the HDMI daemon

exec /usr/sbin/ch7036_monitor ${dev} ${CH7036_MONITOR_OPTIONS}
