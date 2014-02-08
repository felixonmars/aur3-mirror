# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-marc-xml
pkgver=1.0.3
pkgrel=3
pkgdesc="extension to the MARC-Record distribution for working with XML data encoded using the MARC21slim XML schema from the Library of Congress"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/MARC-XML/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12' 'perl-marc-record' 'perl-marc-charset' 'perl-xml-sax')
options=('!emptydirs')
provides=('perl-marc-file-xml=1.0.3')
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-XML-${pkgver}.tar.gz")
md5sums=('fe536ab036e7267d152d4daaf7ef8c9f')

build() {
  cd $srcdir/MARC-XML-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $srcdir/MARC-XML-$pkgver
  make test
}

package() {
  cd $srcdir/MARC-XML-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
