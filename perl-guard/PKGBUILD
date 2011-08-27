# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.11

pkgname='perl-guard'
pkgver='1.021'
pkgrel='1'
pkgdesc="safe cleanup blocks"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Guard'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Guard-1.021.tar.gz')
md5sums=('6c15e885c089115f8263a5873ed74f1e')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Guard-1.021"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "$DIST_DIR"
  $PERL Makefile.PL
  make
  make test
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
