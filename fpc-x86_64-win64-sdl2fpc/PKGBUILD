pkgname=fpc-x86_64-win64-sdl2fpc
pkgver=1.13
pkgrel=1
pkgdesc="Complete SDL 2 headers translation for Free Pascal Compiler (x86_64-win64)"
url="https://bitbucket.org/p_daniel/sdl-2-for-free-pascal-compiler"
license=("zlib")
arch=(any)
makedepends=(fpc-x86_64-win64-rtl mingw-w64-binutils)
options=(!strip staticlibs !buildflags)
source=("http://downloads.sourceforge.net/sdl2fpc/SDL2_for_FPC_$pkgver-src.zip")
sha1sums=('1f72560faaf00d594a4b2cf939e1edf9562fcb78')
_unittgt=x86_64-win64
_fpcver=`fpc -iV`

prepare() {
	find "$srcdir" -type f -exec dos2unix {} \;
}

build() {
  find "$srcdir" -name '*.pas' -exec fpc -O3 -Xs -XX {} \;
}

package() {
  cd "${srcdir}/SDL2"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/sdl2/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
