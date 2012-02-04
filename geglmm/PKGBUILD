# Maintainer: mainframe <>
# Contributor: Laurent Meunier <laurent@deltalima.net>
pkgname=geglmm
pkgver=0.1.0
pkgrel=1
pkgdesc="This is libgeglmm, the C++ bindings for GEGL."
arch=('i686')
url="http://ftp.gnome.org/pub/gnome/sources/geglmm/"
license=('GPL3' 'LGPL3')
depends=('gegl' 'glibmm' 'libsigc++')
source=(http://ftp.gnome.org/pub/gnome/sources/geglmm/0.1/$pkgname-$pkgver.tar.bz2)
md5sums=('cb018d76ce90bc5efb33ecc41a6f678e')
options=(!libtool strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
