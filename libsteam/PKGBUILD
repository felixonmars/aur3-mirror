# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=libsteam
pkgver=0.1
pkgrel=1
pkgdesc="provides client-side functions to interact with the steam network"
url=('http://project-insanity.org')
arch=('i686' 'x86_64')
license=('BSD3')
makedepends=('asciidoc')
source=("http://onny.project-insanity.org/files/libsteam-0.1.tar.gz")
md5sums=('fe4dc8936229a8297a0adbedf023ea42')
build () {
	cd $srcdir/$pkgname-$pkgver
	mkdir build && cd build
	cmake ..
}
package() {
	cd $srcdir/$pkgname-$pkgver/build
	mkdir -p $pkgdir/usr/local/lib $pkgdir/usr/local/bin $pkgdir/usr/share/man/man3
	make DESTDIR=$pkgdir install
}
