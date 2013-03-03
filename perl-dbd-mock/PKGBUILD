# Created by Yuval Hager <yhager@yhager.com>
_cpan_pkg=DBD-Mock
_cpan_author=DICHI
pkgname=perl-dbd-mock #${_cpan_pkg,,}
pkgver=1.45
pkgrel=1
pkgdesc="Mock database driver for testing"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_cpan_pkg}/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12' 'perl-dbi>=1.30')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}/${_cpan_pkg}/${_cpan_pkg}-${pkgver}.tar.gz")
md5sums=('797dcee0e98e7459cad786ab908fcab9')

build() {
  cd $srcdir/${_cpan_pkg}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
  ./Build
}
package() {
  cd $srcdir/${_cpan_pkg}-$pkgver
  ./Build install destdir=${pkgdir}
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
