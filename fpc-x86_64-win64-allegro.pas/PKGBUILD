pkgname=fpc-x86_64-win64-allegro.pas
pkgver=5.0.alpha1
pkgrel=1
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers (x86_64-win64)"
url="http://allegro-pas.sourceforge.net"
license=("custom")
arch=(any)
makedepends=(fpc mingw-w64-binutils)
depends=(fpc-x86_64-win64-rtl)
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/allegro-pas/allegro-pas.$pkgver.zip")
md5sums=('e8c138a5f113784e44d58ded643d4d59')
_unittgt=x86_64-win64
_fpcver=`fpc -iV`

build() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  for file in `ls *.pas`
  do
    fpc -O3 -Xs -XX -Twin64 $file
  done
}

package() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/allegro.pas/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
