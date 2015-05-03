# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=libui-dialog-perl
pkgver=1.09
pkgrel=1
pkgdesc="Wrapper for various dialog applications."
arch=('any')
url="http://search.cpan.org/~kck/UI-Dialog-1.09-2/"
license=('GPL2.1')
depends=('perl' )
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/K/KC/KCK/UI-Dialog-${pkgver}-2.tar.gz)
md5sums=('f612ab7c8b29aa73796c457e454ac366')

prepare() {
  cd $srcdir/UI-Dialog-$pkgver
   perl Makefile.PL
}

build() {
   cd $srcdir/UI-Dialog-$pkgver
   make
}

package() {
   cd $srcdir/UI-Dialog-$pkgver
  make install INSTALLDIRS=vendor DESTDIR=$pkgdir
}