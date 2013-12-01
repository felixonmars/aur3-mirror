# Maintainer: Denis Tikhomirov <dvtikhomirov@gmail.com>
pkgname=mattext
pkgver=0.6
pkgrel=1
pkgdesc="Simple matix-style pager"
arch=('i686' 'x86_64')
url='https://github.com/dhurum/mattext'
license=('BSD')
depends=('ncurses' 'gcc-libs')
makedepends=('git' 'cmake' 'gzip')
source=(https://github.com/dhurum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('ede88e39ee1eee2560f2e16bfcfb675b46a0074e964d442e9ed4d29cb606e369')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
