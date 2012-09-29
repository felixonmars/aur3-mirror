# Maintainer: Xorxcel <yaourt at web dot de>
pkgname=perl-ootools
pkgver=2.3
pkgrel=1
pkgdesc="Pragmas to implement constructors and accessors"
arch=('any')
url="http://search.cpan.org/dist/OOTools/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SK/SKNPP/OOTools-$pkgver.tar.gz)
md5sums=('80498fc74ab05f4bb4d2b14a04b4bcbb')

build() {
  cd  "$srcdir/OOTools-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR="$pkgdir" || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
