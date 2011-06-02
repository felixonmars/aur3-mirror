# Maintainer: Tom Willemsen <ryuslash at gmail dot com>
pkgname=toudou
pkgver=0.2.3
pkgrel=1
pkgdesc="Just another todo application, yay"
arch=('i686' 'x86_64')
url="http://gitorious.org/toudou/toudou"
license=('GPL3')
depends=('libxml2')
makedepends=('cmake' 'make')
source=(http://lxcoding.alwaysdata.net/files/$pkgname-$pkgver.tar.gz)
md5sums=('db8ebda155d92d8920b6c61077c19c57')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
