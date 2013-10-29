# Maintainer: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

pkgname=mingw32-sdl
pkgver=1.2.15
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (mingw32)"
arch=('any')
url="http://libsdl.org/"
license=('LGPL')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc' 'mingw32-w32api' 'mingw32-dx7-headers')
source=(http://libsdl.org/release/SDL-$pkgver.tar.gz)
options=(!strip !buildflags staticlibs)
md5sums=('9d96df8417572a2afb781a7c4c811a85')

build() {
  cd "$srcdir/SDL-$pkgver"

  unset CFLAGS # Kill it with fire, !buildflags is not enough

  ./configure --host=i486-mingw32 \
  --prefix=/usr/i486-mingw32 \
  --enable-static \
  --disable-stdio-redirect \
  --enable-shared

  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
