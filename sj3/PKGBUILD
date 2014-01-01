# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=sj3
pkgver=2.0.1.23p1
pkgrel=1
pkgdesc='A Japanese input system originally developed by Sony'
arch=('i686' 'x86_64')
url="http://code.google.com/p/sj3/"
license=('BSD')
depends=('glibc')
options=('!libtool')
source=("http://sj3.googlecode.com/files/sj3-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/sj3-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin -sysconfdir=/etc localstatedir=/var/lib/sj3 --with-user=root --with-group=root
	make
}

package() {
	cd "${srcdir}/sj3-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('544ccc0abca0b966292e19baf35237f4')
