# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-pdf-table
pkgver=0.9.5
pkgrel=1
pkgdesc="A utility class for building table layouts in a PDF::API2 object"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/PDF-Table/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JB/JBAZIK/PDF-Table-${pkgver}.tar.gz")
md5sums=('1a47637c86691729f0aaf7021cab1b1e')

build() {
  cd $srcdir/PDF-Table-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/PDF-Table-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
