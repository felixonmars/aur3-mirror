# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-search-queryparser'
pkgver='0.94'
pkgrel='1'
pkgdesc="parses a query string into a data structure"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Search-QueryParser'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMI/Search-QueryParser-0.94.tar.gz')
md5sums=('83023900285c1eb4711172fcf97135c4')
sha512sums=('67b31a4ae34186cc646aada1bed8f8a70fe7ddf32a23055d25eae04b818af8106a16b58774495ebe370d4494d2732ad8fea2b577e17c52dd08e262dbeab376bf')
_distdir="${srcdir}/Search-QueryParser-0.94"

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
