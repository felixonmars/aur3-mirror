# $Id: PKGBUILD 137895 2011-09-12 10:02:02Z pierre $

pkgname=bc-alpha
_pkgname=bc
pkgver=1.06.95
pkgrel=2
pkgdesc="GNU's bc (a numeric processing language) and dc (a calculator)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/bc/"
license=('GPL')
depends=('readline' 'ncurses')
conflicts=('bc')
provides=('bc')
install=bc.install

source=("http://alpha.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.bz2"{,.sig}
'bc-1.06.95-sigintmasking.patch'
'bc-1.06.95-memleak.patch'
'bc-1.06.95-matlib.patch'
'bc-1.06-dc_ibase.patch')
sha256sums=('7ee4abbcfac03d8a6e1a8a3440558a3d239d6b858585063e745c760957725ecc'
'd6def8e929b9f1a7ccea19f88a9472881d966b152aa6af52e7470cca89dd88a9'
'5fad5a7311bccecf4492a6c149e710f714d18082777ced3a3d6be6a2b5f3fb6a'
'85a4cb3b4517d4e262e65f12e3cbb44170cb8e1acfa375fe21f0930a35f27753'
'28651436236aaeefa2adcde6f2eea9c433deffb224b6b2f439895a162b2388c6'
'e3b351594b37558f62a52184e7fc2ff7f1ea96f617024e148432b9019e6f3c12')

build() {

  cd "$srcdir/$_pkgname-$pkgver"

  patch -Np1 -i "$srcdir/bc-1.06.95-sigintmasking.patch"
  patch -Np1 -i "$srcdir/bc-1.06.95-memleak.patch"
  patch -Np1 -i "$srcdir/bc-1.06.95-matlib.patch"
  patch -Np1 -i "$srcdir/bc-1.06-dc_ibase.patch"

  autoreconf -fiv
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --infodir=/usr/share/info --with-readline
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
