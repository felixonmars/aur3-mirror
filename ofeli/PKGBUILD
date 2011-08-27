# Maintainer: Aaron Robertson <rbb dot robertson at gmail dot com>
pkgname=ofeli
pkgver=2.0.2
pkgrel=1
license=('LGPL')
pkgdesc="An objective finite element library for C++"
arch=('i686' 'x86_64')
url="http://www.ofeli.net"
depends=('gcc-libs' 'sh')
makedepends=('gcc' 'make')
source=("http://downloads.sourceforge.net/project/ofeli/ofeli/ofeli-2.0.2/ofeli-2.0.2.tar.gz")
options=(!libtool)
md5sums=('9e50feea6fe4f28f594d5f11eff70527')

build() {
	cd $srcdir/ofeli-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$pkgdir/usr install
	mkdir -p $pkgdir/usr/share/ofeli/tutorial/bin
	mv $pkgdir/usr/bin/lesson* $pkgdir/usr/share/ofeli/tutorial/bin
	install -Dm644 $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
