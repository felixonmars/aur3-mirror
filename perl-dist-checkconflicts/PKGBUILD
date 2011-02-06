# Contributor: 3ED <krzysztof1987 at gmail dot com>
#
#-------------# =========> SKIP TEST <==========
  skiptest=0  # If your system going crazy - you
#-------------# can turn off the test here.
#
pkgname='perl-dist-checkconflicts'
_pkgname='Dist-CheckConflicts'
pkgver='0.02'
pkgrel='1'
pkgdesc="declare version conflicts for your dist"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-simple' 'perl-test-fatal' 'perl-sub-exporter' 'perl-list-moreutils')
url='http://search.cpan.org/dist/Dist-CheckConflicts/'
source=(http://search.cpan.org/CPAN/authors/id/D/DO/DOY/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('b2a4c4c7c4c9cce5441d293a1a67631b6dbf94e5204372a06f04eabd819007d2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}" || return 1
  export PERL_MM_USE_DEFAULT=1

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1

  [ "$skiptest" = "1" ] || make test || return 1

  make DESTDIR="${pkgdir}" install || return 1

  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
