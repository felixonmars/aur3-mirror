pkgname=fpc-x86_64-win64-allegro_pas
pkgver=4.4.3
pkgrel=3
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers (x86_64-win64)"
arch=(any)
url="http://allegro-pas.sourceforge.net/"
license=('unknown')
depends=('fpc-x86_64-win64-rtl')
makedepends=('ppcrossx64')
source=("http://downloads.sourceforge.net/allegro-pas/allegro.pas-$pkgver-src-pas.tar.bz2")
md5sums=('d289929fb13320bdca0fdc3a0944adf8')
_fpcvers=`fpc -iV`

build() {
  cd "${srcdir}/allegro.pas/lib"
  for file in `ls *.pas`
  do
    ppcrossx64 -Twin64 $file
  done
}

package() {
  cd "${srcdir}/allegro.pas/lib"
  mkdir -p "$pkgdir/usr/lib/fpc/$_fpcvers/units/x86_64-win64/allegro"
  cp {*.o,*.ppu,*.a} "$pkgdir/usr/lib/fpc/$_fpcvers/units/x86_64-win64/allegro"
}