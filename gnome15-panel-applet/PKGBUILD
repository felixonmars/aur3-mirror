# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=gnome15-panel-applet
pkgver=0.0.2
pkgrel=1
pkgdesc="Panel applet for gnome15"
arch=(any)
url="http://www.gnome15.org/"
license=('GPL')
depends=(gnome15 python-gnomeapplet)
source=(http://www.gnome15.org/downloads/Gnome15/Desktop/$pkgname-$pkgver.tar.gz
        python2.patch
       )
md5sums=('626eb957a0f6722a899d37297ec24f91'
         '5a86cbe7ae05776246f26b77b18aa327')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  patch -p1 -i ../python2.patch

  export PYTHON_VERSION=2
  export PYTHON=python2
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
