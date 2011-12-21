# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=google-sparsehash
pkgver=1.12
pkgrel=1
pkgdesc="An extremely memory-efficient hash_map implementation. 2 bits/entry overhead! The SparseHash library contains several hash-map implementations, including implementations that optimize for space or speed."
arch=("i686" "x86_64")
url="http://code.google.com/p/google-sparsehash"
license=('BSD')
source=("http://google-sparsehash.googlecode.com/files/sparsehash-$pkgver.tar.gz")

build() {
	cd "$srcdir/sparsehash-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/sparsehash-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('077b7d874d924f6f85e88d527ef42a42')
sha1sums=('6c6da5d03b6b71ba69cf056087a94b5f01048782')
