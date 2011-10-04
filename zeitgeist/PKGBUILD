# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=zeitgeist
pkgver=0.8.2
pkgrel=1
pkgdesc="A service which logs the users's activities and events and makes relevant information available to other applications"
arch=('any')
url="http://zeitgeist-project.com/"
license=('GPL')
depends=('dbus-python' 'python2-gobject2' 'pyxdg')
makedepends=('intltool>=0.35.0' 'raptor' 'rdflib')
source=(http://launchpad.net/$pkgname/0.8/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('589e7de784d21177491780bffd11097d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' extra/rdfxml2py
  sed -i 's|python - 2>/dev/null|$PYTHON - 2>/dev/null|' configure{,.ac}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
