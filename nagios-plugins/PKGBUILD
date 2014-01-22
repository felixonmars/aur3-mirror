# Maintainer: Idares <idares@seznam.cz>

pkgname=nagios-plugins
pkgver=1.5
pkgrel=2
pkgdesc="Plugins are scripts and programs that perform host and service checks."
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
url="http://www.nagios-plugins.org"
source=("https://www.nagios-plugins.org/download/$pkgname-$pkgver.tar.gz")
makedepends=('net-snmp')
optdepends=('net-snmp: for SNMP checking.')
conflicts=('monitoring-plugins')

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

md5sums=('730ac30df4a5e88fed8a766a2311d209')
sha1sums=('5d426b0e303a5201073c342d8ddde8bafca1432b')

