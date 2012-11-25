# Maintainer: Eric Renfro <erenfro@gmail.com>

pkgname=corosync1
pkgver=1.4.4
pkgrel=1
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
makedepends=('nss' 'net-snmp')
depends=('nss')
provides=('corosync=1.4.4')
conflicts=('corosync>=0.99.0')
source=("https://github.com/corosync/corosync/archive/v${pkgver}.tar.gz"
	"corosync.init"
	"corosync.service")
md5sums=('4aad649a3a0476f53c820f7170d529c3'
         'fdc3b648f020e165eaa7c3283ce5b9ac'
         'abc267226faafc7dc8246634277705ea')
 
build() {
  cd "${srcdir}/corosync-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr        \
              --sysconfdir=/etc    \
              --localstatedir=/var \
              --enable-monitoring  \
              --enable-snmp        \
              --enable-dbus        \
              --with-systemddir=/usr/lib/systemd/system \
	      --with-initddir=/usr/share/corosync
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  ## Updated and fixed up systemd service unit and associated start/stop script:
  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  cp ${srcdir}/corosync.service ${pkgdir}/usr/lib/systemd/system/corosync.service || return 1
  cp ${srcdir}/corosync.init ${pkgdir}/usr/share/corosync/corosync || return 1
}

