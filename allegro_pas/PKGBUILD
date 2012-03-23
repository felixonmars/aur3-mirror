pkgname=allegro_pas
pkgver=4.4.3
pkgrel=3
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers"
url="http://allegro-pas.sourceforge.net/"
license=('unknown')
arch=(i686 x86_64)
makedepends=('fpc')
optdepends=('allegro4: Allegro shared library')
source=("http://downloads.sourceforge.net/allegro-pas/allegro.pas-$pkgver-src-pas.tar.bz2")
md5sums=('d289929fb13320bdca0fdc3a0944adf8')
_unittgt=`fpc -iSP`-`fpc -iSO`
_fpcvers=`fpc -iV`

build() {
  cd "${srcdir}/allegro.pas/lib"
  for file in `ls *.pas`
  do
    fpc $file
  done
}

package() {
  cd "${srcdir}/allegro.pas/lib"
  mkdir -p "$pkgdir/usr/lib/fpc/$_fpcvers/units/${_unittgt}/allegro"
  cp {*.o,*.ppu,*.a} "$pkgdir/usr/lib/fpc/$_fpcvers/units/${_unittgt}/allegro"
}