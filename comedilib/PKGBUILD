# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=comedilib
pkgver=0.10.2
pkgrel=1
pkgdesc="A user-space library that provides a developer-friendly interface to Comedi devices"
arch=('i686' 'x86_64')
url="http://www.comedi.org"
license=('LGPL')
depends=('bash')
source=("http://www.comedi.org/download/comedilib-$pkgver.tar.gz")
sha512sums=('8adf52001e997e38a685d87db60d5814d43b49be0c76c03ad8b5672ff84945cb8f0f2ff9d69c33d8a08d54c6a9adb50dee683b679e4036a5d6398d2d8f6878ec')

build() {
	cd $srcdir/$pkgname-$pkgver
	LDFLAGS="-lm"
	./configure --prefix=/usr
	make
}

package() {
        cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
