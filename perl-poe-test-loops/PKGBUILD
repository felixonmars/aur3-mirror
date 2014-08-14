# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-poe-test-loops'
pkgver='1.358'
pkgrel='1'
pkgdesc="Reusable tests for POE::Loop authors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/POE-Test-Loops'
source=("http://search.cpan.org/CPAN/authors/id/R/RC/RCAPUTO/POE-Test-Loops-${pkgver}.tar.gz")

build() {
  _distdir="${srcdir}/POE-Test-Loops-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  _distdir="${srcdir}/POE-Test-Loops-${pkgver}"
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  _distdir="${srcdir}/POE-Test-Loops-${pkgver}"
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
md5sums=('d2c55d0a974b7923e8efa9dcce5c84ec')
