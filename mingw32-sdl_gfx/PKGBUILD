# Contributor: Rich Lane <rlane@club.cc.cmu.edu>

pkgname=mingw32-sdl_gfx
pkgver=2.0.22
pkgrel=1
arch=(i686 x86_64)
pkgdesc="sdl_gfx (mingw32)"
depends=()
makedepends=(mingw32-gcc mingw32-sdl)
options=(!strip)
license=(GPL LGPL)
url="http://www.gnu.org/software/gettext/"
source=(http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-$pkgver.tar.gz)
md5sums=('330f291f1f09a1bdf397c9b40d92ca41')

build()
{
	dst=$startdir/pkg/usr/i486-mingw32/

	cd $startdir
	mkdir -p $dst/lib $dst/bin $dst/include/SDL

  cd $startdir/src/SDL_gfx-$pkgver

  unset LDFLAGS

	sed -i 's/gcc/$(CC)/'	Makefile.mingw

  make -f Makefile.mingw CC=i486-mingw32-gcc prefix=/usr/i486-mingw32 || exit 1
  #make -f Makefile.mingw install prefix=$dst || exit 1

	cp SDL_framerate.h SDL_gfxPrimitives.h SDL_gfxPrimitives_font.h SDL_imageFilter.h SDL_rotozoom.h $dst/include/SDL
	cp SDL_gfx.dll $dst/bin
	cp libSDL_gfx.a libSDL_gfx.dll.a $dst/lib

  cd $startdir/pkg
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
}
