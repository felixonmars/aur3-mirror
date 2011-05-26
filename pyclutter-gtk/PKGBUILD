# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=pyclutter-gtk
pkgver=0.10.0
pkgrel=4
pkgdesc="Python bindings to Clutter-GTK."
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL')
depends=('pyclutter' 'clutter-gtk2')
source=(http://www.clutter-project.org/sources/$pkgname/0.10/$pkgname-$pkgver.tar.bz2)
md5sums=('01ab4dc60e7d00737e372f38fdefa9f2')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  find . -name '*.py' -print0|xargs -0 \
      sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
             -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'

  export PYTHON=/usr/bin/python2

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

