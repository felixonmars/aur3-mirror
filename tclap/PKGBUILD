# Contributor: Sébastien Piccand <sebcactus gmail com>
pkgname=tclap
pkgver=1.2.1
pkgrel=1
pkgdesc="TCLAP is a small, flexible library that provides a simple interface for defining and accessing command line arguments"
arch=('i686' 'x86_64')
url="http://tclap.sourceforge.net/"
license=('MIT')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('eb0521d029bf3b1cc0dcaa7e42abf82a')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install || return 1
	# Add the license
	install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
