# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.06
pkgname='perl-test-requires'
pkgver='0.06'
pkgrel='1'
pkgdesc="Checks to see if the module can be loaded"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Test-Requires'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Test-Requires-0.06.tar.gz')
md5sums=('6ce0da3cceadb6420d4c3c5bb69f64db')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Test-Requires-0.06"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    $PERL Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
