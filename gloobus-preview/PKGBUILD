# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gloobus-preview
pkgver=0.4.5.263
_pkgver=0.4.5-ubuntu11~ppa263
pkgrel=1
pkgdesc="An extension of Gnome designed to enable a full screen preview of any kind of file"
arch=(i686 x86_64)
url="http://gloobus.net/"
license=(GPL)
depends=(gtksourceview2 gstreamer0.10-base-plugins poppler-glib libspectre djvulibre taglib python2-gconf xdg-utils)
optdepends=('unoconv: preview LibreOffice compatible documents')
options=(!libtool)
install=$pkgname.install
source=(https://launchpad.net/~gloobus-dev/+archive/$pkgname/+files/${pkgname}_$_pkgver.tar.gz
        gcc46.patch
        gdk-poppler.patch
        webm.patch)
md5sums=(514ef433309a6051ea6064efa93a321d
         14b31eb36a2a9bb0d80cc355f75cb661
         ddda1acea818cdc8891ec5685631f6a4
         01134dc2f4796b861039e296cf1a7b68)

build() {
  cd "$srcdir/$pkgname-build"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/gloobus-preview-configuration

  patch -Np0 -i "$srcdir/gcc46.patch"
  patch -Np1 -i "$srcdir/gdk-poppler.patch"
  patch -Np1 -i "$srcdir/webm.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-build"

  make DESTDIR="$pkgdir/" install
}
