# Maintainer: Matthias Diehn Ingesman <matthias@ingesman.dk>

pkgname=coq-pcc
pkgver=0.16
pkgrel=1
pkgdesc="Program Calculation in Coq."
url="http://traclifo.univ-orleans.fr/SDPP/"
arch=('i686' 'x86_64')
license=('CeCILL-C FREE')
depends=('coq>=8.3pl1' 'coq<8.4')
makedepends=()
source=(http://frederic.loulergue.eu/ftp/ProgramCalculationInCoq-$pkgver.tar.bz2)
md5sums=('d504493a33029ea8c2373fed96812789')

build() {
  cd "$srcdir/ProgramCalculationInCoq-$pkgver"
  patch < "$startdir/Makefile.patch"
  make || return 1
}

package() {
  cd "$srcdir/ProgramCalculationInCoq-$pkgver"
  make DESTDIR=$pkgdir install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 documentation/RR-2009-07.pdf "$pkgdir/usr/share/doc/$pkgname/RR-2009-07.pdf"
}