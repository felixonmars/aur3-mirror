# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=ontv
pkgver=3.2.0
pkgrel=3
pkgdesc="GNOME Applet for monitoring TV programs"
arch=(any)
url="http://live.gnome.org/OnTV"
license=(GPL)
depends=(dbus-python python2-gconf 'python-notify>=0.1.1' vte xmltv hicolor-icon-theme xdg-utils)
makedepends=('gnome-python>=2.16.0' 'intltool>=0.33')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('328becc62bd15728b5f91a42745d2322781f65e958f3dbe392887706331ebf8a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' bin/*

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
