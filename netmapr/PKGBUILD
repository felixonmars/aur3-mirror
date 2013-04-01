# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=netmapr
pkgver=1.9c
pkgrel=1
pkgdesc="A basic network diagramming program with NetViz-style drill-down capabilities"
arch=('i686' 'x86_64')
url="http://www.nethack.net/software/netmapr/"
license=('GPL')
depends=('sdl_ttf' 'libpng')
source=(http://www.nethack.net/software/netmapr/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('fee83bcb3dea5d481518a97232e085f0')

build() {
  cd $srcdir/$pkgname-$pkgver
  # Fix file locations.
  sed -e "s@/usr/local/@$pkgdir/usr/@g" \
      -e "s@-lpng@-lpng -lm@g" \
      -e "s@install -C@install@" Makefile.linux > Makefile
  sed -e "s@^#include <unistd.h>@/* & */@" \
      -e "s@/usr/local/@/usr/@g" -i netmapr.c
  sed -e "/#include <png.h>/a \
    #include <zlib.h>" -i savepng.c
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
}
