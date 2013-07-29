# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
pkgname=fampp2
pkgver=7.0.1
pkgrel=1
pkgdesc="A C++ wrapper for fam from sgi"
arch=('i686' 'x86_64')
url="http://fampp.sourceforge.net/"
license=('GPL2')
depends=('gamin' 'ferrisloki')
source=("http://downloads.sourceforge.net/project/fampp/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('be81aed4cde8aec2ac2632948f8bab60') 

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
