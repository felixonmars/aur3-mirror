# Maintainer: Denis Tikhomirov <dvtikhomirov@gmail.com>
pkgname=mattext
pkgver=0.4
pkgrel=1
pkgdesc="Simple matix-style pager"
arch=('i686' 'x86_64')
url='https://github.com/dhurum/mattext'
license=('BSD')
depends=('ncurses' 'gcc-libs')
makedepends=('git' 'cmake')
source=( https://github.com/dhurum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('26838cfb5f987ec665eeb0676aa4514882411313e05f21ce92876bd7af058fcc')

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
