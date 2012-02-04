# $Id: PKGBUILD 142891 2011-11-17 18:34:59Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg-latest
_pkgname=librsvg
pkgver=2.35.1
pkgrel=1
pkgdesc="A SVG viewing library"
arch=(i686 x86_64)
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libcroco')
makedepends=('intltool' 'gtk2')
optdepends=('gtk2: for rsvg-view support')
options=('!libtool' '!emptydirs')
provides=('librsvg')
conflicts=('librsvg')
url="http://librsvg.sourceforge.net/"
install=librsvg.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/2.35/$_pkgname-$pkgver.tar.xz)
sha256sums=('2e277659d048aa4f3b19755951795ffabb8596ba0d1f0bc255a5ac780a7455ca')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' rsvg.in
  ./configure --prefix=/usr --libexecdir=/usr/lib/$_pkgname \
      --with-croco --disable-static \
      --with-svgz
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
