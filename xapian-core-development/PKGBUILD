pkgname=xapian-core-development
pkgver=1.3.2
pkgrel=1
pkgdesc="Xapian is a highly adaptable toolkit which allows developers to easily add advanced indexing and search facilities to their own applications."
url="http://xapian.org/"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('xapian-core')
provides=('xapian-core')
source=("http://oligarchy.co.uk/xapian/$pkgver/xapian-core-$pkgver.tar.xz")
sha1sums=("b0b22e91e236aacd2a2da07101c31b692e5f81fd")

build() {
	cd "$srcdir/xapian-core-$pkgver"
	./configure --prefix=/usr
	make
}
check() {
	cd "$srcdir/xapian-core-$pkgver"
	make check
}
package() {
	cd "$srcdir/xapian-core-$pkgver"
	make DESTDIR="$pkgdir" install
}
