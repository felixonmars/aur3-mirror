# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=snmptt
pkgver=1.3
pkgrel=3
pkgdesc="A SNMP trap handler"
url="http://snmptt.sourceforge.net"
license=('GPL')
source=("http://downloads.sourceforge.net/project/snmptt/snmptt/snmptt_${pkgver}/snmptt_${pkgver}.tgz")
md5sums=('ee8d8206d3e0d860fee126e09d8eb207')
arch=('i686' 'x86_64')
depends=('perl' 'perl-config-inifiles')

build() {
  cd $startdir/src/snmptt_${pkgver}

  mkdir -p $startdir/pkg/var/log/snmptt

  install -D -m755 snmptt $startdir/pkg/usr/bin/snmptt
  install -D -m755 snmptthandler $startdir/pkg/usr/bin/snmptthandler
  install -D -m755 snmpttconvert $startdir/pkg/usr/bin/snmpttconvert
  install -D -m755 snmpttconvertmib $startdir/pkg/usr/bin/snmpttconvertmib
  install -D -m644 snmptt.ini $startdir/pkg/etc/snmptt.ini
}
