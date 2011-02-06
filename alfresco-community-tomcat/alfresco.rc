#!/bin/bash

[ -f /etc/conf.d/alfresco ] && . /etc/conf.d/alfresco

. /etc/rc.conf
. /etc/rc.d/functions

start_soffice(){
    [ ! -d /opt/alfresco_data/oouser ] && su -c 'mkdir -p /opt/alfresco_data/oouser' ${USER} &>/dev/null
    su -c '/usr/bin/soffice "-accept=socket,host=localhost,port=8100;urp;StarOffice.ServiceManager" "-env:UserInstallation=file:///opt/alfresco_data/oouser" -nologo -headless -nofirststartwizard -nocrashrep -norestore' ${USER} &>/dev/null &
    sleep 2
}

iptables_redirect_tcp(){
    _DPORT=$1
    _NEW_PORT=$2
    if [ -z ${DESTINATION_IP} ]; then
    /usr/sbin/iptables -t nat -A PREROUTING -p tcp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    /usr/sbin/iptables -t nat -A OUTPUT -p tcp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    else
    /usr/sbin/iptables -t nat -A PREROUTING -p tcp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    /usr/sbin/iptables -t nat -A OUTPUT -p tcp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    fi
}

iptables_redirect_udp(){
    _DPORT=$1
    _NEW_PORT=$2
    if [ -z ${DESTINATION_IP} ]; then
    /usr/sbin/iptables -t nat -A PREROUTING -p udp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    /usr/sbin/iptables -t nat -A OUTPUT -p udp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    else
    /usr/sbin/iptables -t nat -A PREROUTING -p udp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    /usr/sbin/iptables -t nat -A OUTPUT -p udp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    fi
}

stop_iptables_redirect_tcp(){
    _DPORT=$1
    _NEW_PORT=$2
    if [ -z ${DESTINATION_IP} ]; then
    /usr/sbin/iptables -t nat -D PREROUTING -p tcp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    /usr/sbin/iptables -t nat -D OUTPUT -p tcp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    else
    /usr/sbin/iptables -t nat -D PREROUTING -p tcp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    /usr/sbin/iptables -t nat -D OUTPUT -p tcp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    fi
}

stop_iptables_redirect_udp(){
    _DPORT=$1
    _NEW_PORT=$2
    if [ -z ${DESTINATION_IP} ]; then
    /usr/sbin/iptables -t nat -D PREROUTING -p udp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    /usr/sbin/iptables -t nat -D OUTPUT -p udp --dport ${_DPORT} -j REDIRECT --to-port ${_NEW_PORT}
    else
    /usr/sbin/iptables -t nat -D PREROUTING -p udp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    /usr/sbin/iptables -t nat -D OUTPUT -p udp -d ${DESTINATION_IP} --dport ${_DPORT} -j DNAT --to-destination ${DESTINATION_IP}:${_NEW_PORT}
    fi
}

start_iptables(){
    # FTP Server
    if [ "${ALFRESCO_FTP}" -eq "1" ]; then
        iptables_redirect_tcp 21 ${PORT_21}
    fi
    # Samba Server
    if [ "${ALFRESCO_SMB}" -eq "1" ]; then
        iptables_redirect_tcp 445 ${PORT_445}
        if [ "${NMB}" -eq "1" ]; then
            iptables_redirect_udp 137 ${PORT_137}
            iptables_redirect_udp 138 ${PORT_138}
            iptables_redirect_tcp 139 ${PORT_139}
        fi
    fi
}

stop_iptables(){
    # FTP Server
    if [ "${ALFRESCO_FTP}" -eq "1" ]; then
        stop_iptables_redirect_tcp 21 ${PORT_21}
    fi
    # Samba Server
    if [ "${ALFRESCO_SMB}" -eq "1" ]; then
        stop_iptables_redirect_tcp 445 ${PORT_445}
        if [ "${NMB}" -eq "1" ]; then
            stop_iptables_redirect_udp 137 ${PORT_137}
            stop_iptables_redirect_udp 138 ${PORT_138}
            stop_iptables_redirect_tcp 139 ${PORT_139}
        fi
    fi
}

case "$1" in
  start)
    stat_busy "Starting Alfresco"
    if [ "${SOFFICE}" -eq "1" ]; then
        start_soffice
    fi
    if [ "${IPTABLES_RULES}" -eq "1" ]; then
        start_iptables
    fi
    su -c '/opt/Alfresco/alfresco.sh start' ${USER} &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon named
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping Alfresco"
    su -c '/opt/Alfresco/alfresco.sh stop' ${USER} &> /dev/null &&
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon named
      stat_done
    fi
    killall -w -u ${USER} &>/dev/null
    if [ "${IPTABLES_RULES}" -eq "1" ]; then
        stop_iptables
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  start_iptables) start_iptables
                  ;;
  stop_iptables) stop_iptables
                  ;;
  *)
    echo "usage: $0 {start|stop|restart|start_iptables|stop_iptables}"  
esac
exit 0
