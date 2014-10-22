# Maintainer: Idares <idares at seznam dot cz>

pkgname=monitoring-plugins
pkgver=2.1
pkgrel=1
pkgdesc="Plugins for Icinga, Naemon, Nagios, Shinken, Sensu, and other monitoring applications."
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'arm')
url="http://www.monitoring-plugins.org"
source=("https://www.monitoring-plugins.org/download/monitoring-plugins-$pkgver.tar.gz")
makedepends=('net-snmp')
optdepends=('net-snmp: for SNMP checking.')
provides=('nagios-plugins')
conflicts=('nagios-plugins')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr/share/nagios
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make prefix=$pkgdir/usr/share/nagios install
	make prefix=$pkgdir/usr/share/nagios install-root
}

md5sums=('9dc3f7d39cfdea60f3929ecdbb4cbb4a')
sha1sums=('5bbc03fe2ce25f2e7a7cd5af9bd15bc050dc8284')

