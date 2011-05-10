# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=gnome15-systemtray
pkgver=0.0.2
pkgrel=1
pkgdesc="System tray icon for gnome15"
arch=(any)
url="http://www.gnome15.org"
license=('GPL')
depends=(gnome15)
source=(http://www.gnome15.org/downloads/Gnome15/Desktop/$pkgname-$pkgver.tar.gz)
md5sums=('5328a4badc3c8b58801e3fadffe307fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  export PYTHON_VERSION=2
  export PYTHON=python2
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
