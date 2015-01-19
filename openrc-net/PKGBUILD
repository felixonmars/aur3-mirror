# Maintainer: artoo <artoo@manjaro.org>

# file vars for easy update
_Cbind=named.confd-r7
_Ibind=named.init-r13
_Isasl=saslauthd2.rc7
_Cdhcp1=dhcpd.conf2
_Cdhcp2=dhcrelay.conf
_Cdhcp3=dhcrelay6.conf
_Idhcp1=dhcpd.init5
_Idhcp2=dhcrelay.init3
_Chost=hostapd-conf.d
_Ihost=hostapd-init.d
_Cip1=iptables-1.4.13.confd
_Cip2=ip6tables-1.4.13.confd
_Iip=iptables-1.4.13-r1.init
_Ikrb1=mit-krb5kadmind.initd-r1
_Ikrb2=mit-krb5kdc.initd-r1
_Ikrb3=mit-krb5kpropd.initd-r1
_Clight=lighttpd.confd
_Ilight=lighttpd.initd
_Cnfs=nfs.confd
_Infs=nfs.initd
_Cnfsc=nfsclient.confd
_Infsc=nfsclient.initd
_Iidmapd=rpc.idmapd.initd
_Ipipefs=rpc.pipefs.initd
_Igssd=rpc.gssd.initd
_Isvcgssd=rpc.svcgssd.initd
_Istatd=rpc.statd.initd
_Cldap=slapd-confd-2.4.28-r1
_Ildap=slapd-initd-2.4.28-r1
_Islp=slpd-init
_Cssh=sshd.confd
_Issh=sshd.rc6.4
_Ipolip=polipo.initd
_Ipostfix=postfix.rc6.2.7
_Ipriv=privoxy.initd
_Cquota=quota.confd
_Iquota1=quota.rc7
_Iquota2=rpc.rquotad.initd
#_Crpc=rpcbind.confd
_Irpc=rpcbind.initd
_Crsync=rsyncd.conf.d
_Irsync=rsyncd.init.d-r1
_Csmb=samba4.confd
_Ismb=samba4.initd-r1
_Csquid=squid.confd-r1
_Isquid=squid.initd-r4
_Ctrans=transmission-daemon.confd.4
_Itrans=transmission-daemon.initd.9
_Cufw=ufw.confd
_Iufw=ufw-2.initd
_Ivsftp=vsftpd.init
_Svsftp=vsftpd-checkconfig.sh
_Cxinet=xinetd.confd
_Ixinet=xinetd.rc6
_Cypbind=ypbind.confd-r1
_Iypbind=ypbind.initd
_Cypserv1=ypserv.confd
_Cypserv2=rpc.yppasswdd.confd
_Cypserv3=rpc.ypxfrd.confd
_Iypserv1=ypserv
_Iypserv2=rpc.yppasswdd-r1
_Iypserv3=rpc.ypxfrd-2.23
_Iautofs=autofs5.initd
_Cvpn=openvpn-2.1.conf
_Ivpn=openvpn-2.1.init
_Cntp=openntpd.conf.d-20080406-r6
_Intp=openntpd.init.d-20080406-r6
_Ctor=tor.confd
_Itor=tor.initd-r6
_Iwicd=wicd.initd
_CSync=syncthing.confd
_ISync=syncthing.initd
_Inginx=nginx.initd-r2

_apver=2.4.10-r1
_aprel=20140731

_dev_uri="http://dev.gentoo.org/~polynomial-c/dist/apache"
_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgbase=openrc-net
pkgname=('autofs-openrc'
	'apache-openrc'
	'bind-openrc'
	'cyrus-sasl-openrc'
	'dhcp-openrc'
	'hostapd-openrc'
	'iptables-openrc'
	'krb5-openrc'
	'lighttpd-openrc'
	'nfs-utils-openrc'
	'openldap-openrc'
	'openslp-openrc'
	'openssh-openrc'
	'openntpd-openrc'
	'openvpn-openrc'
	'polipo-openrc'
	'postfix-openrc'
	'privoxy-openrc'
	'quota-tools-openrc'
	'rpcbind-openrc'
	'rsync-openrc'
	'samba-openrc'
	'squid-openrc'
	'transmission-openrc'
	'ufw-openrc'
	'vsftpd-openrc'
	'xinetd-openrc'
	'ypbind-mt-openrc'
	'ypserv-openrc'
	'tor-openrc'
	'wicd-openrc'
	'syncthing-openrc'
	'nginx-openrc')
pkgver=20150119
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc' 'openrc-net')
conflicts=('openrc'
	  'openrc-git'
	  'openrc-arch-services-git'
	  'initscripts'
	  'systemd-sysvcompat')
source=("${_dev_uri}/gentoo-apache-${_apver}-${_aprel}.tar.bz2"
	"${_gentoo_uri}/net-dns/bind/files/${_Cbind}"
	"${_gentoo_uri}/net-dns/bind/files/${_Ibind}"
	"${_gentoo_uri}/dev-libs/cyrus-sasl/files/${_Isasl}"
	"${_gentoo_uri}/net-misc/dhcp/files/${_Cdhcp1}"
	"${_gentoo_uri}/net-misc/dhcp/files/${_Cdhcp2}"
	"${_gentoo_uri}/net-misc/dhcp/files/${_Cdhcp3}"
	"${_gentoo_uri}/net-misc/dhcp/files/${_Idhcp1}"
	"${_gentoo_uri}/net-misc/dhcp/files/${_Idhcp2}"
	"${_gentoo_uri}/net-wireless/hostapd/files/${_Chost}"
	"${_gentoo_uri}/net-wireless/hostapd/files/${_Ihost}"
	"${_gentoo_uri}/net-firewall/iptables/files/${_Cip1}"
	"${_gentoo_uri}/net-firewall/iptables/files/${_Cip2}"
	"${_gentoo_uri}/net-firewall/iptables/files/${_Iip}"
	"${_gentoo_uri}/app-crypt/mit-krb5/files/${_Ikrb1}"
	"${_gentoo_uri}/app-crypt/mit-krb5/files/${_Ikrb2}"
	"${_gentoo_uri}/app-crypt/mit-krb5/files/${_Ikrb3}"
	"${_gentoo_uri}/www-servers/lighttpd/files/${_Clight}"
	"${_gentoo_uri}/www-servers/lighttpd/files/${_Ilight}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Cnfs}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Infs}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Cnfsc}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Infsc}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Iidmapd}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Ipipefs}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Igssd}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Isvcgssd}"
	"${_gentoo_uri}/net-fs/nfs-utils/files/${_Istatd}"
	"${_gentoo_uri}/net-nds/openldap/files/${_Cldap}"
	"${_gentoo_uri}/net-nds/openldap/files/${_Ildap}"
	"${_gentoo_uri}/net-libs/openslp/files/${_Islp}"
	"${_gentoo_uri}/net-misc/openssh/files/${_Cssh}"
	"${_gentoo_uri}/net-misc/openssh/files/${_Issh}"
	"${_gentoo_uri}/net-proxy/polipo/files/${_Ipolip}"
	"${_gentoo_uri}/mail-mta/postfix/files/${_Ipostfix}"
	"${_gentoo_uri}/net-proxy/privoxy/files/${_Ipriv}"
	"${_gentoo_uri}/sys-fs/quota/files/${_Cquota}"
	"${_gentoo_uri}/sys-fs/quota/files/${_Iquota1}"
	"${_gentoo_uri}/sys-fs/quota/files/${_Iquota2}"
	#"${_gentoo_uri}/net-nds/rpcbind/files/${_Crpc}"
	"${_gentoo_uri}/net-nds/rpcbind/files/${_Irpc}"
	"${_gentoo_uri}/net-misc/rsync/files/${_Crsync}"
	"${_gentoo_uri}/net-misc/rsync/files/${_Irsync}"
	"${_gentoo_uri}/net-fs/samba/files/4.1/${_Csmb}"
	"${_gentoo_uri}/net-fs/samba/files/4.1/${_Ismb}"
	"${_gentoo_uri}/net-proxy/squid/files/${_Csquid}"
	"${_gentoo_uri}/net-proxy/squid/files/${_Isquid}"
	"${_gentoo_uri}/net-p2p/transmission/files/${_Ctrans}"
	"${_gentoo_uri}/net-p2p/transmission/files/${_Itrans}"
	"${_gentoo_uri}/net-firewall/ufw/files/${_Cufw}"
	"${_gentoo_uri}/net-firewall/ufw/files/${_Iufw}"
	"${_gentoo_uri}/net-ftp/vsftpd/files/${_Svsftp}"
	"${_gentoo_uri}/net-ftp/vsftpd/files/${_Ivsftp}"
	"${_gentoo_uri}/sys-apps/xinetd/files/${_Cxinet}"
	"${_gentoo_uri}/sys-apps/xinetd/files/${_Ixinet}"
	"${_gentoo_uri}/net-nds/ypbind/files/${_Cypbind}"
	"${_gentoo_uri}/net-nds/ypbind/files/${_Iypbind}"
	"${_gentoo_uri}/net-nds/ypserv/files/${_Cypserv1}"
	"${_gentoo_uri}/net-nds/ypserv/files/${_Cypserv2}"
	"${_gentoo_uri}/net-nds/ypserv/files/${_Cypserv3}"
	"${_gentoo_uri}/net-nds/ypserv/files/${_Iypserv1}"
	"${_gentoo_uri}/net-nds/ypserv/files/${_Iypserv2}"
	"${_gentoo_uri}/net-nds/ypserv/files/${_Iypserv3}"
	"${_gentoo_uri}/net-fs/autofs/files/${_Iautofs}"
	"${_gentoo_uri}/net-misc/openvpn/files/${_Cvpn}"
	"${_gentoo_uri}/net-misc/openvpn/files/${_Ivpn}"
	"${_gentoo_uri}/net-misc/openntpd/files/${_Cntp}"
	"${_gentoo_uri}/net-misc/openntpd/files/${_Intp}"
	#"${_gentoo_uri}/net-misc/wicd/files/${_Iwicd}"
	"${_gentoo_uri}/net-misc/tor/files/${_Ctor}"
	"${_gentoo_uri}/net-misc/tor/files/${_Itor}"
	"${_Iwicd}"
	"${_CSync}"
	"${_ISync}"
	"${_gentoo_uri}/www-servers/nginx/files/${_Inginx}")

pkgver() {
  date +%Y%m%d
}

_shebang='s|#!/sbin/runscript|#!/usr/bin/openrc-run|'
_runpath='s|/var/run|/run|g'
_binpath=('s|/usr/sbin|/usr/bin|g' 's|/sbin|/usr/bin|g')

package_apache-openrc() {
    pkgdesc="OpenRC apache init script"
    depends=('openrc-core' 'apache')
    backup=('etc/conf.d/httpd')
    install=apache.install

    install -Dm755 "${srcdir}/gentoo-apache-${_apver}/init/apache2.confd" "${pkgdir}/etc/conf.d/httpd"
    install -Dm755 "${srcdir}/gentoo-apache-${_apver}/init/apache2.initd" "${pkgdir}/etc/init.d/httpd"

    local _p1='s|/usr/sbin/apache2|/usr/bin/apachectl|' \
	  _p2='s|/etc/apache2/httpd.conf|/etc/httpd/conf/httpd.conf|' \
	  _p3='s/! test -f/test -f/' \
	  _p4='s|/usr/lib/apache2|/usr/lib/httpd|' \
	  _p5='s|apache2.pid|httpd/httpd.pid|' \
	  _p6='s|apache2 >/dev/null|httpd >/dev/null|' \
	  _p7='s|apache2|httpd|g' \
	  _p8='s|/run/apache_ssl_mutex|/run/httpd|'
    sed -e "${_shebang}" -e "${_p1}" -e "${_p2}" -e "${_p3}" \
	-e "${_p4}" -e "${_p5}" -e "${_p6}" -e "${_p8}" -i "${pkgdir}/etc/init.d/httpd"
    sed -e "${_p2}" -e "${_p4}" -e "${_p5}" -e "${_p7}" -i "${pkgdir}/etc/conf.d/httpd"
}

package_autofs-openrc() {
    pkgdesc="OpenRC autofs init script"
    depends=('openrc-core' 'autofs')
    install=autofs.install

    install -Dm755 "${srcdir}/${_Iautofs}" "${pkgdir}/etc/init.d/autofs"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/autofs"
}

package_bind-openrc() {
    pkgdesc="OpenRC bind init script"
    depends=('openrc-core' 'bind')
    backup=('etc/conf.d/named')
    install=bind.install

    install -Dm755 "${srcdir}/${_Cbind}" "${pkgdir}/etc/conf.d/named"
    install -Dm755 "${srcdir}/${_Ibind}" "${pkgdir}/etc/init.d/named"

    local _p1='s|/etc/bind/named.conf|/etc/named.conf|g'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e "${_p1}" -i "${pkgdir}/etc/init.d/named"
}

package_cyrus-sasl-openrc() {
    pkgdesc="OpenRC cyrus-sasl init script"
    depends=('openrc-core' 'cyrus-sasl')
    install=cyrus-sasl.install

    install -Dm755 "${srcdir}/${_Isasl}" "${pkgdir}/etc/init.d/saslauthd"

    sed -e "${_shebang}" -e "${_binpath[0]}" -i "${pkgdir}/etc/init.d/saslauthd"
}

package_dhcp-openrc() {
    pkgdesc="OpenRC dhcp init script"
    depends=('openrc-core' 'dhcp')
    optdepends=('openldap-openrc: openldap initscript'
		'bind-openrc: bind initscript')
    backup=('etc/conf.d/dhcpd'
	    'etc/conf.d/dhcrelay'
	    'etc/conf.d/dhcrelay6')
    install=dhcp.install

    install -Dm755 "${srcdir}/${_Cdhcp1}" "${pkgdir}/etc/conf.d/dhcpd"
    install -Dm755 "${srcdir}/${_Cdhcp2}" "${pkgdir}/etc/conf.d/dhcrelay"
    install -Dm755 "${srcdir}/${_Cdhcp3}" "${pkgdir}/etc/conf.d/dhcrelay6"

    install -Dm755 "${srcdir}/${_Idhcp1}" "${pkgdir}/etc/init.d/dhcpd"
    install -Dm755 "${srcdir}/${_Idhcp2}" "${pkgdir}/etc/init.d/dhcrelay"
    install -Dm755 "${srcdir}/${_Idhcp2}" "${pkgdir}/etc/init.d/dhcrelay6"

    local _p1='s|#@slapd@|ldap slapd|'
    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}"  -e "${_p1}" -i $f
    done
}

package_hostapd-openrc() {
    pkgdesc="OpenRC hostapd init script"
    depends=('openrc-core' 'hostapd')
    backup=('etc/conf.d/hostapd')
    install=hostapd.install

    install -Dm755 "${srcdir}/${_Chost}" "${pkgdir}/etc/conf.d/hostapd"
    install -Dm755 "${srcdir}/${_Ihost}" "${pkgdir}/etc/init.d/hostapd"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/hostapd"
}

package_iptables-openrc() {
    pkgdesc="OpenRC iptables init script"
    depends=('openrc-core' 'iptables')
    backup=('etc/conf.d/iptables'
	    'etc/conf.d/ip6tables')
    install=iptables.install

    install -Dm755 "${srcdir}/${_Cip1}" "${pkgdir}/etc/conf.d/iptables"
    install -Dm755 "${srcdir}/${_Iip}" "${pkgdir}/etc/init.d/iptables"
    install -Dm755 "${srcdir}/${_Cip2}" "${pkgdir}/etc/conf.d/ip6tables"
    install -Dm755 "${srcdir}/${_Iip}" "${pkgdir}/etc/init.d/ip6tables"

    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath[1]}" -e "${_runpath}" -i $f
    done
}

package_krb5-openrc() {
    pkgdesc="OpenRC krb5 init script"
    depends=('openrc-core' 'krb5')
    install=krb5.install

    install -Dm755 "${srcdir}/${_Ikrb1}" "${pkgdir}/etc/init.d/krb5kadmind"
    install -Dm755 "${srcdir}/${_Ikrb2}" "${pkgdir}/etc/init.d/krb5kdc"
    install -Dm755 "${srcdir}/${_Ikrb3}" "${pkgdir}/etc/init.d/krb5kpropd"

    local _p1='s|mit-krb5kdc|krb5kdc|g' \
	  _p2='s|mit-krb5kadmind|krb5kadmind|g'
    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e "${_p1}" -e "${_p2}" -i $f
    done
}

package_lighttpd-openrc() {
    pkgdesc="OpenRC lighttpd init script"
    depends=('openrc-core' 'lighttpd')
    backup=('etc/conf.d/lighttpd')
    install=lighttpd.install

    install -Dm755 "${srcdir}/${_Clight}" "${pkgdir}/etc/conf.d/lighttpd"
    install -Dm755 "${srcdir}/${_Ilight}" "${pkgdir}/etc/init.d/lighttpd"
    local _p1='s/lighttpd:lighttpd/http:http/'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e ${_p1} -i "${pkgdir}/etc/init.d/lighttpd"
}

package_rpcbind-openrc() {
    pkgdesc="OpenRC rpcbind init script"
    depends=('openrc-core' 'rpcbind')
    #backup=('etc/conf.d/rpcbind')
    install=rpcbind.install

    #install -Dm755 "${srcdir}/${_Crpc}" "${pkgdir}/etc/conf.d/rpcbind"
    local _p1='s|RPCBIND_OPTS|RPCBIND_ARGS|'

    install -Dm755 "${srcdir}/${_Irpc}" "${pkgdir}/etc/init.d/rpcbind"

    sed -e "${_shebang}" -e "${_binpath[1]}" -e "${_runpath}" -e "${_p1}" -i "${pkgdir}/etc/init.d/rpcbind"
}

package_nfs-utils-openrc() {
    pkgdesc="OpenRC nfs-utils init script"
    depends=('nfs-utils' 'rpcbind-openrc' 'device-mapper-openrc')
    optdepends=('ypbind-openrc: ypbind initscript'
		'quota-tools-openrc: quota-tools initscript'
		'bind-openrc: bind initscript')
    backup=('etc/conf.d/nfs'
	    'etc/conf.d/nfsclient')
    install=nfs-utils.install

    install -Dm755 "${srcdir}/${_Cnfs}" "${pkgdir}/etc/conf.d/nfs"
    install -Dm755 "${srcdir}/${_Infs}" "${pkgdir}/etc/init.d/nfs"
    
    install -Dm755 "${srcdir}/${_Cnfsc}" "${pkgdir}/etc/conf.d/nfsclient"
    install -Dm755 "${srcdir}/${_Infsc}" "${pkgdir}/etc/init.d/nfsclient"
    
    install -Dm755 "${srcdir}/${_Igssd}" "${pkgdir}/etc/init.d/rpc.gssd"
    install -Dm755 "${srcdir}/${_Iidmapd}" "${pkgdir}/etc/init.d/rpc.idmapd"
    install -Dm755 "${srcdir}/${_Ipipefs}" "${pkgdir}/etc/init.d/rpc.pipefs"
    install -Dm755 "${srcdir}/${_Istatd}" "${pkgdir}/etc/init.d/rpc.statd"
    install -Dm755 "${srcdir}/${_Isvcgssd}" "${pkgdir}/etc/init.d/rpc.svcgssd"

    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i $f
    done
}

package_openntpd-openrc() {
    pkgdesc="OpenRC openntpd init script"
    depends=('openrc-core' 'openntpd')
    groups=('openrc-net')
    provides=('openrc-timed')
    conflicts=('ntp'
	      'ntp-openrc'
	      'openrc'
	      'openrc-git'
	      'openrc-arch-services-git'
	      'initscripts'
	      'systemd-sysvcompat')
    backup=('etc/conf.d/ntpd')
    install=openntpd.install

    install -Dm755 "${srcdir}/${_Cntp}" "${pkgdir}/etc/conf.d/ntpd"
    install -Dm755 "${srcdir}/${_Intp}" "${pkgdir}/etc/init.d/ntpd"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/ntpd"
}

package_openldap-openrc() {
    pkgdesc="OpenRC openldap init script"
    depends=('openrc-core' 'openldap')
    backup=('etc/conf.d/slapd')
    install=openldap.install

    install -Dm755 "${srcdir}/${_Cldap}" "${pkgdir}/etc/conf.d/slapd"
    install -Dm755 "${srcdir}/${_Ildap}" "${pkgdir}/etc/init.d/slapd"

    local _p1='s|/usr/lib/openldap/slapd|/usr/lib/slapd|g'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e "${_p1}" -i "${pkgdir}/etc/init.d/slapd"
}

package_openslp-openrc() {
    pkgdesc="OpenRC openslp init script"
    depends=('openrc-core' 'openslp')
    install=openslp.install

    install -Dm755 "${srcdir}/${_Islp}" "${pkgdir}/etc/init.d/slpd"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/slpd"
}

package_openssh-openrc() {
    pkgdesc="OpenRC openssh init script"
    depends=('openrc-core' 'openssh')
    optdepends=('bind-openrc: bind initscript')
    backup=('etc/conf.d/sshd')
    install=openssh.install

    install -Dm755 "${srcdir}/${_Cssh}" "${pkgdir}/etc/conf.d/sshd"
    install -Dm755 "${srcdir}/${_Issh}" "${pkgdir}/etc/init.d/sshd"

    sed -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/conf.d/sshd"
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/sshd"
}

package_openvpn-openrc() {
    pkgdesc="OpenRC openvpn init script"
    depends=('openrc-core' 'openvpn')
    backup=('etc/conf.d/openvpn')
    install=openvpn.install

    install -Dm755 "${srcdir}/${_Cvpn}" "${pkgdir}/etc/conf.d/openvpn"
    install -Dm755 "${srcdir}/${_Ivpn}" "${pkgdir}/etc/init.d/openvpn"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/openvpn"
}

package_polipo-openrc() {
    pkgdesc="OpenRC polipo init script"
    depends=('openrc-core' 'polipo')
    install=polipo.install

    install -Dm755 "${srcdir}/${_Ipolip}" "${pkgdir}/etc/init.d/polipo"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/polipo"
}

package_postfix-openrc() {
    pkgdesc="OpenRC postfix init script"
    depends=('openrc-core' 'postfix')
    optdepends=('bind-openrc: bind initscript'
		'ypbind-openrc: ypbind initscript'
		'cyrus-sasl-openrc: cyrus-sasl initscript')
    install=postfix.install

    install -Dm755 "${srcdir}/${_Ipostfix}" "${pkgdir}/etc/init.d/postfix"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/postfix"
}

package_privoxy-openrc() {
    pkgdesc="OpenRC privoxy init script"
    depends=('openrc-core' 'privoxy')
    install=privoxy.install

    install -Dm755 "${srcdir}/${_Ipriv}" "${pkgdir}/etc/init.d/privoxy"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/privoxy"
}

package_quota-tools-openrc() {
    pkgdesc="OpenRC quota-tools init script"
    depends=('quota-tools' 'rpcbind-openrc')
    optdepends=('ypbind-openrc: ypbind initscript')
    backup=('etc/conf.d/quota')
    install=quota-tools.install

    install -Dm755 "${srcdir}/${_Cquota}" "${pkgdir}/etc/conf.d/quota"
    install -Dm755 "${srcdir}/${_Iquota1}" "${pkgdir}/etc/init.d/quota"
    install -Dm755 "${srcdir}/${_Iquota2}" "${pkgdir}/etc/init.d/rpc.rquotad"


    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i $f
    done
}

package_rsync-openrc() {
    pkgdesc="OpenRC rsync init script"
    depends=('openrc-core' 'rsync')
    backup=('etc/conf.d/rsyncd')
    install=rsync.install

    install -Dm755 "${srcdir}/${_Crsync}" "${pkgdir}/etc/conf.d/rsyncd"
    install -Dm755 "${srcdir}/${_Irsync}" "${pkgdir}/etc/init.d/rsyncd"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/rsyncd"
}

package_samba-openrc() {
    pkgdesc="OpenRC samba init script"
    depends=('openrc-core' 'samba')
    backup=('etc/conf.d/smb')
    install=samba.install

    install -Dm755 "${srcdir}/${_Csmb}" "${pkgdir}/etc/conf.d/smb"
    install -Dm755 "${srcdir}/${_Ismb}" "${pkgdir}/etc/init.d/smb"

    local _p1='s/="samba"/="smb"/'
    sed -e "${_binpath[0]}" -e ${_p1} -i "${pkgdir}/etc/conf.d/smb"

    _p1='s/##samba/##smb/'
    local _p2='s|"samba"|"smb"|'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e ${_p1} -e ${_p2} -i "${pkgdir}/etc/init.d/smb"
}

package_squid-openrc() {
    pkgdesc="OpenRC squid init script"
    depends=('openrc-core' 'squid')
    optdepends=('bind-openrc: bind initscript')
    backup=('etc/conf.d/squid')
    install=squid.install

    install -Dm755 "${srcdir}/${_Csquid}" "${pkgdir}/etc/conf.d/squid"
    install -Dm755 "${srcdir}/${_Isquid}" "${pkgdir}/etc/init.d/squid"

    local _p1='s|chown squid|chown proxy|' \
	  _p2='s|squid:squid|proxy:proxy|'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e "${_p1}" -e "${_p2}" -i "${pkgdir}/etc/init.d/squid"
}

package_transmission-openrc() {
    pkgdesc="OpenRC transmission init script"
    depends=('openrc-core' 'transmission-cli')
    backup=('etc/conf.d/transmission-daemon')
    install=transmission.install

    install -Dm755 "${srcdir}/${_Ctrans}" "${pkgdir}/etc/conf.d/transmission-daemon"
    install -Dm755 "${srcdir}/${_Itrans}" "${pkgdir}/etc/init.d/transmission-daemon"

    sed -e "${_shebang}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/transmission-daemon"
}

package_ufw-openrc() {
    pkgdesc="OpenRC ufw init script"
    depends=('openrc-core' 'ufw')
    backup=('etc/conf.d/ufw')
    install=ufw.install

    install -Dm755 "${srcdir}/${_Cufw}" "${pkgdir}/etc/conf.d/ufw"
    install -Dm755 "${srcdir}/${_Iufw}" "${pkgdir}/etc/init.d/ufw"

    local _p1='s|/usr/share/ufw/ufw-init-functions|/usr/lib/ufw/ufw-init-functions|g'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e "${_p1}" -i "${pkgdir}/etc/init.d/ufw"
}

package_vsftpd-openrc() {
    pkgdesc="OpenRC vsftpd init script"
    depends=('openrc-core' 'vsftpd')
    optdepends=('bind-openrc: bind initscript')
    install=vsftpd.install

    install -Dm755 "${srcdir}/${_Ivsftp}" "${pkgdir}/etc/init.d/vsftpd"
    install -Dm755 "${srcdir}/${_Svsftp}" "${pkgdir}/usr/lib/vsftpd-checkconfig.sh"

    local _p1='s|/usr/libexec/|/usr/lib/|g' \
	  _p2='s|/etc/vsftpd/|/etc/|g'
    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -e "${_p1}" -e "${_p2}" -i "${pkgdir}/etc/init.d/vsftpd"
    sed -e "${_p2}" -i "${pkgdir}/usr/lib/vsftpd-checkconfig.sh"
}

package_xinetd-openrc() {
    pkgdesc="OpenRC xinetd init script"
    depends=('openrc-core' 'xinetd')
    backup=('etc/conf.d/xinetd')
    install=xinetd.install

    install -Dm755 "${srcdir}/${_Cxinet}" "${pkgdir}/etc/conf.d/xinetd"
    install -Dm755 "${srcdir}/${_Ixinet}" "${pkgdir}/etc/init.d/xinetd"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/xinetd"
}

package_ypbind-mt-openrc() {
    pkgdesc="OpenRC ypbind-mt init script"
    depends=('ypbind-mt' 'rpcbind-openrc' 'openslp-openrc')
    optdepends=('ypserv-openrc: ypserv initscript')
    backup=('etc/conf.d/ypbind')
    install=ypbind-mt.install

    install -Dm755 "${srcdir}/${_Cypbind}" "${pkgdir}/etc/conf.d/ypbind"
    install -Dm755 "${srcdir}/${_Iypbind}" "${pkgdir}/etc/init.d/ypbind"

    sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/ypbind"
}

package_ypserv-openrc() {
    pkgdesc="OpenRC ypserv init script"
    depends=('openrc-core' 'ypserv')
    backup=('etc/conf.d/rpc.yppasswdd'
	    'etc/conf.d/rpc.ypxfrd'
	    'etc/conf.d/ypserv')
    install=ypserv.install

    install -Dm755 "${srcdir}/${_Cypserv1}" "${pkgdir}/etc/init.d/ypserv"
    install -Dm755 "${srcdir}/${_Iypserv1}" "${pkgdir}/etc/conf.d/ypserv"
    install -Dm755 "${srcdir}/${_Cypserv2}" "${pkgdir}/etc/conf.d/rpc.yppasswdd"
    install -Dm755 "${srcdir}/${_Iypserv2}" "${pkgdir}/etc/init.d/rpc.yppasswdd"
    install -Dm755 "${srcdir}/${_Cypserv3}" "${pkgdir}/etc/conf.d/rpc.ypxfrd"
    install -Dm755 "${srcdir}/${_Iypserv3}" "${pkgdir}/etc/init.d/rpc.ypxfrd"

    for f in ${pkgdir}/etc/init.d/*;do
      sed -e "${_shebang}" -e "${_binpath[0]}" -e "${_runpath}" -i $f
    done
}

package_tor-openrc() {
    pkgdesc="OpenRC tor init script"
    depends=('openrc-core' 'tor')
    backup=('etc/conf.d/tor')
    install=tor.install

    install -Dm755 "${srcdir}/${_Ctor}" "${pkgdir}/etc/conf.d/tor"
    install -Dm755 "${srcdir}/${_Itor}" "${pkgdir}/etc/init.d/tor"

    sed -e "${_shebang}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/tor"
}

package_wicd-openrc() {
    pkgdesc="OpenRC wicd script"
    depends=('openrc-core' 'wicd')
    install=wicd.install

    install -Dm755 "${srcdir}/${_Iwicd}" "${pkgdir}/etc/init.d/wicd"
}

package_syncthing-openrc() {
    pkgdesc="OpenRC syncthing init script"
    depends=('openrc-core' 'syncthing')
    backup=('etc/conf.d/syncthing')
    install=syncthing.install

    install -Dm755 "${srcdir}/${_CSync}" "${pkgdir}/etc/conf.d/syncthing"
    install -Dm755 "${srcdir}/${_ISync}" "${pkgdir}/etc/init.d/syncthing"

}

package_nginx-openrc() {
    pkgdesc="OpenRC nginx init script"
    depends=('openrc-core' 'nginx')
    install=nginx.install

    install -Dm755 "${srcdir}/${_Inginx}" "${pkgdir}/etc/init.d/nginx"

    sed -e "${_shebang}" -e "${_binpath[0]}" -i "${pkgdir}/etc/init.d/nginx"
}
sha256sums=('8e093a18582c3a20283ed1c09de9acc6832a80b1d5a02962599db0535d38af19'
            '3cf1ab72446cb9417de916e4cd732f2056fb74d2c6f03da6741b7bae8c415448'
            '55024fe0e2b491b5cb490a9f575bad3096d446f20f8d52778d778fd26a415d52'
            'a095def10c3b7e6894a6d782c70cbe176c7b53f36386dcc4b1e5bc75424e29f0'
            'e8a413e9102948b336f60041fc3cade33125faf56d8319ee65d9f3c63199a8e7'
            'a157630c3bdc9565cca8240ee1e6539fc9cbc1e4642c40e0965e3609d1021bac'
            '099f668e1ad42ed9446b15675032a1186715d1fe9e4a1b24dfb787e68495d2b6'
            '049a231908dc2c5f82446712d71d5e75d430bd043b53eead1529f2d81e1595ab'
            '204aaf81d51dc119cee1d1ff3ae3dd50af666af2f8b2a363fd1bf442d4dcee00'
            '916f4b14095ee4ec8a510391c883e9f01868e18d79a3d5cbeb13a104a793d45d'
            'b9701b9ea509638ee1ed74bec38a22e6bd7358763497ce53c146d2faf9e97a61'
            '7e2341211ca14997b7a8a1f930f94db855291af597c568f680f80031c20d45b6'
            '2938fe4206514d9868047bd8f888a699fa2097ca69edab176453436d4259abaa'
            '13047698e03079b754957e1e548ce7505dfb2c73c9a31f87e061140603ab0e44'
            '3e55c79f19aaa6ef6b64a621c03dbb2eac3ad923916dc803f4c1bfe48ce89fbb'
            '709309dea043aa306c2fcf0960e0993a6db540c220de64cf92d6b85f1cca23c5'
            'c374ea05d7e9f15e10c8f9dbd0cad6548e0f92aef7de33e5dbc27222e9407e7b'
            'bb6e6721f33e6582a91025f3500e159a599fb856d699e9394093e1018c7925e0'
            'b1515472c32927039b38f6c3a797cbc54a5a300b5d6fa54df9550174afa2b7f8'
            '22bba4ee5d58bae422650875c7c8a797a52fc121ddd02d48297c075b8a35401e'
            '1e77bc6fb2ceb266f724818898bd42bec47512a5a7ede6660e0565ea1c58d619'
            'a1ecfb9441052d374b6bc2b77554a3253a4e4c231c76114b3313d2cc68e561b8'
            '426996fc12758565d4c827762df76634f40cc8915988ab89ba5e81aeb561cf46'
            '3ce65326859c43983dad25ad2d4731488c488037796e39b6b5eda336e8bf81ef'
            'ebee63e81fb952474c34b745913e8774b29c9cc65180d363a33d991e478aea2d'
            '00d9c29280a83e8458c33139d04a9b38c6fdba9d7cb9b420ca83bf6b10e6435d'
            'f1c460d8b0e91e54a551397d755135d05a3728d81de596535bf8bda074455677'
            '0c7bd35a14da6c0c2577f09ae82a41ddb693a88157eeaf80684616f79be6c304'
            '5bca003ec3b67c7c78519aede1d82002579006ccfecce8f87b559df719f82e92'
            '1fc515a6816b8a750db513df0b3b9bf8dd8bd4c4e9051205521acadfdebeae0f'
            '7f228796e020c0779c52683f684197d50662ae890b1ae193ffa9acf157ccd143'
            '29c6d57ac3ec6018cadc6ba6cd9b90c9ed46e20049b970fdcc68ee2481a2ee41'
            '97221a017d8ee9de996277c5a794d973a0b5e8180c29c97b3652bd1984a7b5d0'
            'ff37dacce4551b6ef9866435d586b014aae5fef5b6c3ae7ba839165514644765'
            '51f4bffa535d891f94d4a20ca2a4a42cc99189f3de78cee1c8d235e4a9d1721d'
            '224496b498b4f692ae3316a95b5c7c8b6230dcd5fee0ca163956a7acde243de9'
            '00d1dfb3b893db5d6a213a4edda622c7d64dcafa40b3019f15e070c164286632'
            '00ce705b49aaa356d9d9f0be3b80a3fe2810471cbe02fd0edc66349f3ca281de'
            'c3896303d6cfebf314a3f6b8aeed0f6cb6ae421c4c0923b0121c76b3251314e5'
            '6561ae40c5899a9f7a12f1f0867bec47d47c7cc3c583574ffcecbbf6f8d8afbb'
            'de758791b16b89a648c01867af7f51bc9bd44e40cbe868e439b753ff5d9572e5'
            'baff64277f9aa62cf1eeed2284bb08c4f3078a8e6e7604e4fec228ca5fa9dd82'
            '53755809cc27fdbaf98752cd3da45b5c2bda62dd46fcc37570c6e237f7954ffa'
            '9f4eaba0b966fd30351fa66cac9a666b5ec1dc54035ddad94c61a2f43dcb2d62'
            '214a184495a3384eb452caef435256043bc51e35140a61b1f5fdff32603c8f7e'
            '3830cb94600ac658a6ff1f9f31bdbece64caf3ad23c62ae0a887d152970125f5'
            '249689688aad23d0d27ccdd08a0907fd85058d6a52ccd3467f756b07f5d059ee'
            '06d047b47befe6aaf1b1542fdd50e84ea38e0fef004b5095f6096f33fa1901a3'
            '069aa7382b40aecebf26ef53f3f4c49890314e0357925c84b3c15f1d0b913be0'
            '657b5305923b2a5de9eb96931aaaa28d6e997ace6c40793d905887798094258c'
            '2de7c7c1edfe3ae0480e22d988a564db3bb873050929ebb6e8361d7a1288ddda'
            'e6cf3df546aae57bb10e2b4282a9ccd79741473ef9dbdbd7628a16c84622da06'
            'e401e2cf7c0180a170d3dc3e91d7e98002bae7b013df72813b7bcf89b864fb3a'
            '6aeb4ec9b8ccc062b5ee8c609830c05cee3ed790fa90d7b2d8cf82a09e317c5c'
            '79f6c6ed4875f00fe702f69e9a6180a032d5a47f3e58e892e6ba0e2746b6fec8'
            '3cdd6872fae15dc8533b3f75ac36ad59ffb946a3f1b445d688629c621cebbe34'
            '4edd475ca95d31cfcea20a8e6268024f8128423bc7ae67edb535e6811c64668e'
            'e46afe737bfc57aa31be1a441615fcc112e1ebf41d631c1929e00b81baca119d'
            'bd1f245a362f85319e83965e8b825e66e686a4a0bf185ab8ec51fd335bc873c2'
            '08db79845b497f2ec8938854ffac904aeed747d98c0820ad0be9e5aa9377512b'
            'e827778b8a8e6984b637c745c315a2e02ebc46af752651b7a70626ba545a84b6'
            'a6445dd607093fdafb013e5896f60d78223549b38c96300fe239bcf5dbf2a8de'
            'f2c44e5018719f644e194a4e8e43390bdc9926c533f79c41f0abf84879799d05'
            '330149a83684ddabe413d134d4c8efad4c88b18c2ab67165014deff5f7fffad2'
            'd1b1f8a00935d77521bceb62535350444df3470fa45f4d33c3934051a1bb595b'
            '91fb1497b3a6ef0bb3a3d5baefdff801d8ff1cba27aaf742303415550814a09b'
            'fca7183a7676f0f471878925c8fbec20b7a0bff01551c0ad2b34d4d8a826c876'
            '41d780f291847e19f632428bbf27c3f289414afd237546d2974da1b75384c25c'
            '49da1b5f267927023bc092adcf89d406ec294584039d6bca6b7aea0a9e7c4c4f'
            '66b2b53b077ddc2d5eb1d81faa99fa0f4f0db01520900ba948001e539bfe02d8'
            'eb4a4315916fe3f8688c1da5bb5c249a1f402e61617452288d5b0668078c955c'
            '63708b1a7b61ae791df64bb4cefa01dc12236f96bb67fe6d0b2c513e11c81f3e'
            '9d5fca09d0161446a5cec30a0694cdc0656469403a008920a52a190051218b36')
