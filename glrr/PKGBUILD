# Maintainer: hotvic <victor.feradecs@gmail.com>

pkgname=glrr
pkgver=20050529
pkgrel=1
pkgdesc="Is a library that provides a framework for developing a UI-independent application."
arch=('i686' 'x86_64')
url="http://glrr.sourcearchive.com/"
license=('GPL')
depends=('gtk' 'gtk3' 'glib')
makedepends=('binutils' 'gcc' 'make' 'fakeroot' 'm4' 'pkg-config')
source=("http://glrr.sourcearchive.com/downloads/$pkgver-3ubuntu1/glrr_$pkgver.orig.tar.gz")
md5sums=('ea63afe2cee5598c9ae5d34976cdbb96')

build() {
	cd $srcdir/glrr-20050529.orig

	./configure --prefix=/usr --disable-static
	make
	make DESTDIR="$pkgdir" install
}