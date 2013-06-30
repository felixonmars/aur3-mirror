pkgname=jujuutils
pkgver=0.2
pkgrel=1
pkgdesc="Programs to list and change the configuration of FireWire devices connected to a Linux computer."
arch=('i686' 'x86_64')
url="http://code.google.com/p/jujuutils/"
license=('GPL')
source=(http://jujuutils.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=(9f3f1a8a4641aba93186910f68a73acceaac06e8)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
