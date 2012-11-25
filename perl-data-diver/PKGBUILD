# Contributor: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname='perl-data-diver'
_perlname='Data-Diver'
pkgver='1.0101'
pkgrel='1'
pkgdesc="Simple, ad-hoc access to elements of deeply nested structures"
arch=('any')
url='http://search.cpan.org/~tyemq/Data-Diver-1.0101/Diver.pm'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/T/TY/TYEMQ/${_perlname}-${pkgver}.tgz")

build() {
  cd $srcdir/${_perlname}-${pkgver}
  perl Makefile.PL installdirs=vendor destdir=$pkgdir
  make
  make test
}

package() {
  cd $srcdir/${_perlname}-${pkgver}
  make install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

md5sums=('1488a2da416f27abcc90a5052bace6fe')
