# Contributor: 3ED <krzysztof1987 at gmail dot com>

skiptest=0

pkgname='perl-lib-base'
_pkgname='base'
pkgver='2.15'
pkgrel='1'
pkgdesc="Establish an ISA relationship with base classes at compile time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-test-simple')
url='http://search.cpan.org/dist/base/'
source=(http://search.cpan.org/CPAN/authors/id/R/RG/RGARCIA/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('4ccfd0b3c1aba37ac7684e4fd6e90ecd8d05c89f0e4af2d3d587796eb0f7b542')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}" || return 1
  export PERL_MM_USE_DEFAULT=1
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  [ "$skiptest" = "1" ] || make test || return 1
  make DESTDIR="${pkgdir}" install || return 1
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
