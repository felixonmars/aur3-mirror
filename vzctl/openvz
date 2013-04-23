#!/bin/sh
#
# based on gentoo startup script from opnvz
#

. /etc/rc.conf
. /etc/rc.d/functions

VZ_MODULES="simfs vzmon vzdquota vzdev"
VZ_NET_MODULES="vznetdev vznet vzethdev"
VZ_MIGRATE_MODULES="vzcpt vzrst"
VZ_PLOOP_MODULES="ploop pfmt_ploop1 pfmt_raw pio_direct pio_nfs"
#${IPTABLES_MODULES:="${IPTABLES}"}
#IPTABLES_MODULES="ip_tables ${IPTABLES_MODULES} xt_tcpudp"
#${PRELOAD_MODULES:="af_packet"}

IP="ip"
MODPROBE="modprobe"
SYSCTL="sysctl"

VPSCONFDIR="/etc/vz/conf"
VZDEV=venet0
VZCTL="/usr/sbin/vzctl"
VZQUOTA="/usr/sbin/vzquota"

start_net() {
  local mod

  stat_busy "Setting up network for OpenVZ"

  for mod in ${VZ_NET_MODULES}; do
    ${MODPROBE} $mod 2> /dev/null
  done

  for mod in ${VZ_PLOOP_MODULES}; do
    ${MODPROBE} $mod 2> /dev/null
  done

  ${IP} link set ${VZDEV} up
  ${IP} addr add 0.0.0.0/0 dev ${VZDEV}
  ${SYSCTL} -q -w net.ipv4.conf.${VZDEV}.send_redirects=0

  stat_done
}

stop_net() {
  local mod

  $IP link set ${VZDEV} down 2> /dev/null

  for mod in ${VZ_NET_MODULES}; do
    ${MODPROBE} -r $mod &> /dev/null
  done
}

start_ve() {
  local velist veid

  cd ${VPSCONFDIR}
  velist=$(grep -l '^ONBOOT=yes\|^ONBOOT=\"yes\"' [0-9]*.conf 2>/dev/null | sed -e 's/.conf//g' | sort -n)
  cd - > /dev/null

  ${SYSCTL} -q -w net.ipv4.route.src_check=0

  for veid in ${velist}; do
    stat_busy "Starting VE ${veid}"

    ${VZCTL} start ${veid} &> /dev/null

    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
  done

  return 0
}

stop_ve() {
  local veid velist

  if [ ! -f /proc/vz/veinfo ]; then
    return 0
  fi

  velist=$(awk '$1 != 0 {print $1}' /proc/vz/veinfo | sort -nr)

  for veid in ${velist}; do
    stat_bkgd "Stopping VE ${veid}"

    ${VZCTL} set ${veid} --cpuunits 2000 --cpulimit 0 &> /dev/null
    ${VZCTL} stop ${veid} &> /dev/null &
  done

  # wait for ve's to stop
  for veid in ${velist}; do
    sleep 1
    velist=$(awk '$1 != 0 {print $1}' /proc/vz/veinfo | sort -nr)
  done

  return 0
}

case "$1" in
  start)
    stat_busy "Loading OpenVZ modules"

    if [ -e /dev/vzctl ]; then
      echo "OpenVZ is already running."
      stat_fail
      exit 1
    fi

    # Load modules
    for mod in ${VZ_MODULES}; do
      /sbin/modprobe -r $mod &> /dev/null
      /sbin/modprobe $mod &> /dev/null
    done

    if [ ! -e /dev/vzctl ]; then
      stat_fail
      exit 1
    fi

    for mod in ${VZ_MIGRATE_MODULES}; do
      /sbin/modprobe -r $mod &> /dev/null
      /sbin/modprobe $mod &> /dev/null
    done

    stat_done

    start_net
    start_ve

    stat_busy "Starting OpenVZ"
    add_daemon openvz
    stat_done
    ;;
  stop)
    stop_ve
    # network modules removed here
    stop_net

    for mod in ${VZ_MIGRATE_MODULES} ${VZ_MODULES}; do
      /sbin/modprobe -r $mod &> /dev/null
    done

    stat_busy "Stopping OpenVZ"
    rm_daemon openvz
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
