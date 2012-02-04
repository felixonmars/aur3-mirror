# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-data-optlist'
pkgver='0.107'
pkgrel='1'
pkgdesc="parse and validate simple name/value option pairs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-params-util' 'perl-sub-install>=0.921')
makedepends=('perl-test-simple')
url='http://search.cpan.org/dist/Data-OptList'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-OptList-0.107.tar.gz')
md5sums=('17177b3cfb8941780a8736f9b9b30421')
_distdir="${srcdir}/Data-OptList-0.107"

build() {
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
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
