# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-module-bundled-files
_pkgname=Module-Bundled-Files
pkgver=0.03
pkgrel=1
pkgdesc="Access files bundled with Module"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Module-Bundled-Files/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12' 'perl-class-isa')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PC/PCAMPBELL/${_pkgname}-${pkgver}.tar.gz")
md5sums=('bcefaf9448046a0d379775216027bfd7')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $srcdir/${_pkgname}-$pkgver
  make test
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
