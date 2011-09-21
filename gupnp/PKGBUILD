# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gupnp
pkgver=0.18.0
pkgrel=1
pkgdesc="An object-oriented open source framework for creating UPnP devices and control points, written in C using GObject and libsoup"
arch=(i686 x86_64)
url="http://gupnp.org/"
license=(LGPL)
depends=('gssdp>=0.11.2')
makedepends=(gobject-introspection)
optdepends=(python2: for gupnp-binding-tool)
options=(!libtool)
source=(http://download.gnome.org/sources/$pkgname/0.18/$pkgname-$pkgver.tar.xz)
sha256sums=('82f4758b26ef0531cf6301f526fe705f06c329eaef403bb30925128fcbb6a71a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' tools/gupnp-binding-tool

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
