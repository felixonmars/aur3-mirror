pkgname=allegro.pas
pkgver=5.0.alpha1
pkgrel=1
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers"
url="http://allegro-pas.sourceforge.net"
license=("custom")
arch=(i686 x86_64)
makedepends=(fpc)
depends=(fpc)
source=("http://downloads.sourceforge.net/allegro-pas/allegro-pas.$pkgver.zip")
md5sums=('e8c138a5f113784e44d58ded643d4d59')
_unittgt=`fpc -iSP`-`fpc -iSO`
_fpcver=`fpc -iV`

build() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  for file in `ls *.pas`
  do
    fpc -O3 -Xs -XX $file
  done
}

package() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/allegro-pas/"{}
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/allegro-pas/LICENSE"
}
