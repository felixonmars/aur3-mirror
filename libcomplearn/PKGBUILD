# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=libcomplearn
pkgver=1.1.7
pkgrel=3
epoch=
pkgdesc="a library and utilities for compression-based learning"
arch=('i686' 'x86_64')
url="http://www.complearn.org/"
license=('BSD')
groups=('complearn')
depends=('gsl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.complearn.org/downloads/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('e43e2a2c6f3791bf6dd06496e14c263f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  grep -rl '#include <glib/garray.h>' src/ | xargs sed -i 's|#include <glib/garray.h>|#include <glib.h>|g'
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
