# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-locale-currency-format
pkgver=1.30
pkgrel=1
pkgdesc="Perl functions for formatting monetary values"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Locale-Currency-Format/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/T/TN/TNGUYEN/Locale-Currency-Format-${pkgver}.tar.gz")
md5sums=('d7e42d194fcfda7779cebbcb3d878dbd')

build() {
  cd $srcdir/Locale-Currency-Format-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/Locale-Currency-Format-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:

