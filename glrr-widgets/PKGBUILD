# Maintainer: hotvic <victor.feradecs@gmail.com>

pkgname=glrr-widgets
pkgver=20050529
pkgrel=1
pkgdesc="Is a library that provides a framework for developing a UI-independent application."
arch=('i686' 'x86_64')
url="http://glrr-widgets.sourcearchive.com"
license=('GPL')
depends=('gtk' 'gtk3' 'glib')
makedepends=('binutils' 'gcc' 'make' 'fakeroot' 'm4' 'pkg-config')
source=("http://glrr-widgets.sourcearchive.com/downloads/$pkgver-3ubuntu1/glrr-widgets_$pkgver.orig.tar.gz")
md5sums=('58b7035af761a9207ef3c95aa57d5073')

build() {
	cd $srcdir/glrr-widgets-20050529.orig

	./configure --prefix=/usr --disable-static
	make
	make DESTDIR="$pkgdir" install
}