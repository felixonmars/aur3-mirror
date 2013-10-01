pkgname=mingw32-sdl2-mixer-hg
pkgver=664
pkgrel=0
pkgdesc="hg build of sdl2_mixer (mingw32)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_mixer/"
license=('ZLIB')
depends=('mingw32-sdl-hg' 'mingw32-libvorbis' 'mingw32-smpeg2' 'mingw32-libmodplug')
makedepends=('mercurial' 'mingw32-gcc')
optdepends=('mingw32-flac' 'mingw32-fluidsynth' 'mingw32-libmikmod')
provides=('mingw32-sdl2_mixer')
conflicts=('mingw32-sdl2_mixer')
options=(!libtool !strip !buildflags)
source=('sdl2_mixer::hg+http://hg.libsdl.org/SDL_mixer')
md5sums=('SKIP')

_hgrepo="sdl2_mixer"

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  hg identify -n
}

prepare() {
  mkdir "${srcdir}/${_hgrepo}/build"
}

build() {
  cd "${srcdir}/${_hgrepo}/"
  ./autogen.sh
  cd "${srcdir}/${_hgrepo}/build"
  PKG_CONFIG_PATH=/usr/i486-mingw32/lib/pkgconfig \
  ../configure --host=i486-mingw32 \
  --prefix=/usr/i486-mingw32 \
  --enable-static \
  --enable-shared
  make
}

package() {
  cd "${srcdir}/${_hgrepo}/build"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 ../COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
## vim:set ts=2 sw=2 et:
