pkgname=fpc32-allegro.pas
pkgver=5.0.alpha1
pkgrel=1
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers (multilib)"
url="http://allegro-pas.sourceforge.net"
license=("unknown")
arch=(x86_64)
depends=(fpc-multilib)
options=(staticlibs)
source=("http://downloads.sourceforge.net/allegro-pas/allegro-pas.$pkgver.zip")
md5sums=('e8c138a5f113784e44d58ded643d4d59')
_fpcvers=`fpc -iV`

build() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  for file in `ls *.pas`
  do
    ppcross386 -Tlinux -O3 -Xs -XX $file
  done
}

package() {
  cd "${srcdir}/allegro-pas.${pkgver%.alpha*}/lib"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' -o -name '*.compiled' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/i386-linux/"{}
}
