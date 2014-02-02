# Maintainer: Denis Tikhomirov <dvtikhomirov@gmail.com>
pkgname=mattext
pkgver=0.7.1
pkgrel=1
pkgdesc="Simple matrix-style pager"
arch=('i686' 'x86_64')
url='https://github.com/dhurum/mattext'
license=('BSD')
depends=('ncurses' 'gcc-libs')
makedepends=('git' 'cmake' 'gzip')
source=(https://github.com/dhurum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('dc49b8cff889a9575334f303110dbb16053af00bfbd671fc75b32937be95acd7')

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
