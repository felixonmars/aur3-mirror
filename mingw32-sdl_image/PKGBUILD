# Maintainer: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

pkgname=mingw32-sdl_image
pkgver=1.2.12
pkgrel=2
pkgdesc="A simple library to load images of various formats as SDL surfaces (mingw32)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_image/"
license=('LGPL')
depends=('mingw32-sdl' 'mingw32-libpng' 'mingw32-runtime')
makedepends=('mingw32-gcc')
source=(http://www.libsdl.org/projects/SDL_image/release/SDL_image-$pkgver.tar.gz)
options=(!strip !buildflags staticlibs)
md5sums=('a0f9098ebe5400f0bdc9b62e60797ecb')

build() {
  cd "$startdir/src/SDL_image-$pkgver"

  PKG_CONFIG_PATH=/usr/i486-mingw32/lib/pkgconfig \
  ./configure --host=i486-mingw32 \
  --prefix=/usr/i486-mingw32 \
  --enable-static \
  --enable-shared \
  --disable-png-shared \
  --disable-webp --disable-webp-shared

  make
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
