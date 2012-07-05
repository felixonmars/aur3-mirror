# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-chi-driver-dbi'
pkgver='1.25'
pkgrel='1'
pkgdesc="Use DBI for cache storage"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-chi>=0.241' 'perl-dbi>=1.26')
makedepends=('perl-test-class')
url='http://search.cpan.org/dist/CHI-Driver-DBI'
source=('http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/CHI-Driver-DBI-1.25.tar.gz')
md5sums=('9d01b931d30c69608c1b5c1a2e9c183d')
sha512sums=('544c5b1f387410d4d23c00ed2059dfce07c21946f96d33bfb8d561bca832f85880f9d29f49d60c3f1717207f0ad629a670f93014ece097826d8d680aecc3619c')
_distdir="${srcdir}/CHI-Driver-DBI-1.25"

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
