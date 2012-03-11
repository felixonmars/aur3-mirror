pkgname=allegro_pas
pkgver=4.4.3
pkgrel=2
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers"
url="http://allegro-pas.sourceforge.net/"
license=('unknown')
[ "$CARCH" = "i686"   ] && _unitsdir=i386-linux
[ "$CARCH" = "x86_64" ] && _unitsdir=x86_64-linux
arch=(i686 x86_64)
makedepends=('fpc')
optdepends=('allegro4: Allegro shared library')
source=("http://downloads.sourceforge.net/allegro-pas/allegro.pas-$pkgver-src-pas.tar.bz2")
md5sums=('d289929fb13320bdca0fdc3a0944adf8')

build() {
  cd "${srcdir}/allegro.pas/lib"
  fpc al3d.pas
  fpc alblend.pas
  fpc alfile.pas
  fpc alflic.pas
  fpc algui.pas
  fpc alvga.pas
}

package() {
  cd "${srcdir}/allegro.pas/lib"
  mkdir -p "$pkgdir/usr/lib/fpc/2.6.0/units/${_unitsdir}/allegro"
  mv *.o "$pkgdir/usr/lib/fpc/2.6.0/units/${_unitsdir}/allegro"
  mv *.ppu "$pkgdir/usr/lib/fpc/2.6.0/units/${_unitsdir}/allegro"
  mv *.a "$pkgdir/usr/lib/fpc/2.6.0/units/${_unitsdir}/allegro"
}