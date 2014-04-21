# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
pkgname=movit
pkgver=1.1.1
pkgrel=1
pkgdesc="The modern video toolkit"
arch=(x86_64)
url="http://movit.sesse.net/"
license=('GPL')
depends=('fftw' 'libepoxy')
makedepends=('gtest' 'eigen' 'libpng' 'sdl2_image')
optdepends=('libpng12: demo application', 'sdl_image: demo application')
source=(http://movit.sesse.net/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$pkgname-$pkgver"
    sed -ie 's/libpng12/libpng/g' configure
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('f40855a125dce04357bde230b6deb07a')
