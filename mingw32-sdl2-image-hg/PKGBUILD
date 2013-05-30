pkgname=mingw32-sdl2-image-hg
pkgver=380
pkgrel=0
pkgdesc="hg build of sdl2_image (mingw32)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_image/"
license=('ZLIB')
depends=(mingw32-sdl-hg mingw32-runtime)
makedepends=(mercurial mingw32-gcc mingw32-libpng)
optdepends=(mingw32-libpng mingw32-libtiff mingw32-libjpeg)
provides=(mingw32-sdl2_image)
conflicts=(mingw32-sdl2_image)
options=(!libtool !strip !buildflags)
source=('sdl2_image::hg+http://hg.libsdl.org/SDL_image')
md5sums=('SKIP')

_hgrepo="sdl2_image"

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
  --enable-shared \
  --disable-webp --disable-webp-shared
  # Sorry WEBP, there is no AUR mingw32 packages for you yet.   :(
  make
}

package() {
  cd "${srcdir}/${_hgrepo}/build"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 ../COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
## vim:set ts=2 sw=2 et:
