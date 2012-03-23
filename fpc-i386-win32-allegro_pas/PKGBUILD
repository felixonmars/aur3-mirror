pkgname=fpc-i386-win32-allegro_pas
pkgver=4.4.3
pkgrel=3
pkgdesc="Allegro.pas is a wrapper to use Allegro with Pascal compilers (i386-win32)"
arch=(any)
url="http://allegro-pas.sourceforge.net/"
license=('unknown')
depends=('fpc-i386-win32-rtl')
makedepends=('ppcross386')
optdepends=('mingw32-allegro4: Allegro DLL and tools compiled for MinGW')
source=("http://downloads.sourceforge.net/allegro-pas/allegro.pas-$pkgver-src-pas.tar.bz2")
md5sums=('d289929fb13320bdca0fdc3a0944adf8')
_fpcvers=`fpc -iV`

build() {
  cd "${srcdir}/allegro.pas/lib"
  for file in `ls *.pas`
  do
    ppcross386 -Twin32 $file
  done
}

package() {
  cd "${srcdir}/allegro.pas/lib"
  mkdir -p "$pkgdir/usr/lib/fpc/$_fpcvers/units/i386-win32/allegro"
  cp {*.o,*.ppu,*.a} "$pkgdir/usr/lib/fpc/$_fpcvers/units/i386-win32/allegro"
}