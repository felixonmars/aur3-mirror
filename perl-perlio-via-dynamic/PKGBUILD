# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
pkgname='perl-perlio-via-dynamic'
pkgver='0.13'
pkgrel='1'
pkgdesc="dynamic PerlIO layers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/PerlIO-via-dynamic'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLKAO/PerlIO-via-dynamic-0.13.tar.gz')
md5sums=('3715f57c346f0c185e24fbc8f580b33b')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/PerlIO-via-dynamic-0.13"
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
