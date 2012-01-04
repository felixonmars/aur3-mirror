# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=cZUI
pkgname=czui
pkgver=0.4.0
pkgrel=1
pkgdesc="A C++ user interface toolkit for rapid development of zoomable interfaces."
arch=(i686 x86_64)
url="http://czui.sourceforge.net/"
license=('GPL')
depends=('sdl')
makedepends=('doxygen')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$_name-$pkgver/$_name-$pkgver.tar.bz2")
md5sums=('4b1983a8e71b67daa3390bc99e0d0b0b')

build() {
  cd "$srcdir/$_name-$pkgver"

  # add missing header
  sed -i '25a#include <cstddef>' src/include/cZUI/context.h
  sed -i '14a#include <cstddef>' src/include/cZUI/alloc_list.h

  # doc path fix
  sed -i '/cZUI/s/$(prefix)/$(DESTDIR)\/$(datarootdir)/' doxygen/Makefile.*

  # dot fix
  sed -i '/dot/s/\/usr\/bin\///' Doxyfile.in

  ./configure --prefix=/usr \
              --enable-static=no
  make

  # generate html docs
  doxygen
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
