# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-marc-charset
pkgver=1.33
pkgrel=1
pkgdesc="convert MARC-8 encoded strings to UTF-8"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/MARC-Charset/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-Charset-${pkgver}.tar.gz")
md5sums=('02882113257742eef9c11adf29a16854')

build() {
  cd $srcdir/MARC-Charset-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/MARC-Charset-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
