# Maintainer: Jan Zak <zj at zakjan dot cz>
pkgname=libbsb
pkgver=0.0.7
pkgrel=1
pkgdesc="Portable C library for reading and writing BSB format image files"
arch=("i686" "x86_64")
url=("http://libbsb.sourceforge.net/")
license=("unknown")
depends=("libtiff" "libpng")
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz/download")
md5sums=('58480a145c1cd79651fa958bb3ab7a6d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix /usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
