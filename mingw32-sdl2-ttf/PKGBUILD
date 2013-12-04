# Contributor: Rich Lane <rlane@club.cc.cmu.edu>
# Contributor: PedroHLC

_target=i486-mingw32
_sysroot=/usr/${_target}

pkgname=mingw32-sdl2-ttf
pkgver=2.0.12
pkgrel=1
arch=(any)
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications - Version 2 (${_target})"
depends=(mingw32-runtime mingw32-sdl-hg mingw32-freetype>=2.0.0)
makedepends=(mingw32-gcc cmake)
options=(staticlibs !strip !buildflags)
license=('MIT')
url="http://www.libsdl.org/projects/SDL_ttf"
source=("http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz")
md5sums=('79787216b56cb4707f39d538f2225e00')

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}"
  unset LDFLAGS
  
  export PKG_CONFIG_PATH=${_sysroot}/lib/pkgconfig
  ./autogen.sh  
  ./configure \
    --prefix=${_sysroot} \
    --host=${_target} \
    --build=$CHOST \
    --enable-shared \
    --enable-static \
    --disable-sdltest  \
    --with-freetype-prefix=/usr/${_target}
  make
}

package() {
  cd "${srcdir}/SDL2_ttf-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}