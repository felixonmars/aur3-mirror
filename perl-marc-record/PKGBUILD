# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-marc-record
pkgver=2.0.3
pkgrel=1
pkgdesc="Perl extension for handling MARC records"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/MARC-Record/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-Record-${pkgver}.tar.gz")
md5sums=('c7600e06046bdcc028386f0ec419cc9c')

build() {
  cd $srcdir/MARC-Record-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/MARC-Record-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
