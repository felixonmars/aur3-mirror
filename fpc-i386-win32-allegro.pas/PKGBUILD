pkgname=fpc-i386-win32-allegro.pas
pkgver=5.0.alpha1
pkgrel=1
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers (i386-win32)"
url="http://allegro-pas.sourceforge.net"
license=("custom")
arch=(any)
makedepends=(ppcross386 mingw-w64-binutils)
depends=(fpc-i386-win32-rtl)
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/allegro-pas/allegro-pas.$pkgver.zip")
md5sums=('e8c138a5f113784e44d58ded643d4d59')
_unittgt=i386-win32
_fpcver=`fpc -iV`

build() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  for file in `ls *.pas`
  do
    ppcross386 -O3 -Xs -XX -Twin32 $file
  done
}

package() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/allegro.pas/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 i686-w64-mingw32-strip -g
}
