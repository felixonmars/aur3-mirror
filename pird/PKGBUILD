# Maintainer: Gustavo Lopes <mail@geleia.net>
pkgname=pird
pkgver=0.10.1
pkgrel=2
pkgdesc="A simple cd ripper written in D"
arch=('i686' 'x86_64')
url="https://github.com/karheinz/pird"
license=('GPL')
depends=(libcdio libcdio-paranoia)
makedepends=(dmd cmake)
source=("https://github.com/karheinz/pird/archive/v${pkgver}.tar.gz")
md5sums=('32e9672d498adbf848558e56b221cff6')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make pird
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
