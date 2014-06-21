# Maintainer: William Robertson <wkr@wkr.io>

pkgname=hyperleveldb
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="HyperDex LevelDB."
arch=('i686' 'x86_64')
url="http://hyperdex.org/"
license=('GPL')
depends=('snappy')
source=("http://hyperdex.org/src/$pkgname-$pkgver.tar.gz")
md5sums=('fd07184f057b7f13068b307afa55fc70')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
