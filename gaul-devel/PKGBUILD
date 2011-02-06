# Contributor: Feng Wang <wanng dot fenng at mail dot com>

pkgname=gaul-devel
_pkgname=gaul
pkgver=0.1850
pkgrel=0
pkgdesc="A flexible programming library for evolutionary computation. Steady-state, generational and island model genetic algorithms are supported, using Darwinian, Lamarckian or Baldwinian evolution. Includes support for multiprocessor and distributed systems."
arch=('i686' 'x86_64')
url="http://gaul.sourceforge.net/"
license=('GPL v2')
depends=()
makedepends=('gcc')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgname/$pkgname-$pkgver-$pkgrel.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  ./configure --prefix=/usr --enable-g=no --enable-ccoptim=yes --enable-debug=no --enable-memory-debug=no --enable-pthread=yes || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}

md5sums=('3a832c882b0df0f5c46f733d360fd7bb')
