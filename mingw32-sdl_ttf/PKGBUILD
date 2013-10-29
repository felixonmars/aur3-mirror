# Maintainer: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

pkgname=mingw32-sdl_ttf
pkgver=2.0.11
pkgrel=2
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (mingw32)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_ttf/"
license=('LGPL')
depends=('mingw32-sdl' 'mingw32-freetype' 'mingw32-runtime')
makedepends=('mingw32-gcc')
source=(http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-$pkgver.tar.gz)
options=(!strip !buildflags staticlibs)
md5sums=('61e29bd9da8d245bc2471d1b2ce591aa')

build() {
  cd "$srcdir/SDL_ttf-$pkgver"

  ./configure --host=i486-mingw32 \
  --prefix=/usr/i486-mingw32 \
  --with-sdl-prefix=/usr/i486-mingw32 \
  --with-freetype-prefix=/usr/i486-mingw32

  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
