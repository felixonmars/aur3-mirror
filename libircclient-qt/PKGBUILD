# Contributor: Scott Olson <scott@scott-olson.org>
pkgname=libircclient-qt
pkgver=0.5.0
pkgrel=1
pkgdesc="A cross-platform IRC client library written with Qt 4"
arch=(i686 x86_64)
url="https://bitbucket.org/jpnurmi/libircclient-qt"
license=('LGPL')
depends=(qt icu)
options=()
source=(https://bitbucket.org/jpnurmi/libircclient-qt/downloads/$pkgname-src-$pkgver.tar.gz)
md5sums=('3f87b31468322bbaadd081c54e336aa7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  qmake
  make || return 1
  make INSTALL_ROOT=$pkgdir QTDIR=/usr install || return 1
}

# vim:set ts=2 sw=2 et:
