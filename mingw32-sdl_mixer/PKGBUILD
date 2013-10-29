# Maintainer: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

pkgname=mingw32-sdl_mixer
pkgver=1.2.12
pkgrel=3
pkgdesc="A simple multi-channel audio mixer (mingw32)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_mixer/"
license=('LGPL')
depends=('mingw32-sdl' 'mingw32-runtime')
makedepends=('mingw32-gcc')
options=(!strip !buildflags staticlibs)
source=(http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-$pkgver.tar.gz)
md5sums=('e03ff73d77a55e3572ad0217131dc4a1')

build() {
  cd "$srcdir/SDL_mixer-$pkgver"

  # mingw32-smpeg needed for music-mp3
  # mingw32-mikmod needed for music-mod

  PKG_CONFIG_PATH=/usr/i486-mingw32/lib/pkgconfig \
  ./configure --host=i486-mingw32 \
  --prefix=/usr/i486-mingw32 \
  --disable-music-mod \
  --disable-music-mp3

  make build/libSDL_mixer.la
  sed -i 's/-lmingw32//' build/libSDL_mixer.la
  make
}

package() {
  cd "$srcdir/SDL_mixer-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
