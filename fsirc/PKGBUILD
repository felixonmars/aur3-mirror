# Contributor: adriano <adriano.src gmail com>
# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=fsirc
pkgver=3.1
pkgrel=3
pkgdesc="Simple IRC client in Qt4/C++."
arch=('i686' 'x86_64')
url="https://code.google.com/p/fsirc/"
license=('GPL')
depends=('qt4')
makedepends=('cmake')
source=(http://nblast.org/store/src/$pkgname-$pkgver.tar.bz2)
md5sums=('607b22e45f4da5e14ff1af2deb05dbc5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
