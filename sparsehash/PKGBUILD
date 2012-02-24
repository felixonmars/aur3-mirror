# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=sparsehash
pkgver=2.0.2
pkgrel=1
pkgdesc="An extremely memory-efficient hash_map implementation. 2 bits/entry overhead! The SparseHash library contains several hash-map implementations, including implementations that optimize for space or speed."
arch=("i686" "x86_64")
url="http://code.google.com/p/sparsehash"
license=('BSD')
source=("http://sparsehash.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('1db92ed7f257d9b5f14a309d75e8a1d4')
sha1sums=('12c7552400b3e20464b3362286653fc17366643e')
