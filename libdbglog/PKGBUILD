# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libdbglog
pkgver=1.5.4
pkgrel=1
pkgdesc="C++ library for debugging purposes and runtime logging to file with extension for Python and PHP"
arch=('i686' 'x86_64')
url="http://dbglog.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/dbglog/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('aab63604f3a2cda558af0ac88e592335')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
