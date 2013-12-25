# Maintainer: Ken Tossell <ken@tossell.net>
pkgname=mavlink-git
pkgver=20131224
pkgrel=1
pkgdesc="MAVLink micro air vehicle marshalling / communication library"
arch=('i686' 'x86_64')
url="http://qgroundcontrol.org/mavlink/"
license=('LGPL')
makedepends=('git' 'cmake' 'python')
source=("$pkgname"::'git://github.com/mavlink/mavlink.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cp "$srcdir/$pkgname/pymavlink/generator/C/include_v1.0/mavlink_conversions.h" \
     "$srcdir/$pkgname/pymavlink/generator/C/include_v0.9/mavlink_conversions.h"

  mkdir -p "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  cmake "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
