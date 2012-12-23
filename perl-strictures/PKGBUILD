# Maintainer : Konrad Borowski <glitchmr@myopera.com> 
# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-strictures'
pkgver='1.004004'
pkgrel='1'
pkgdesc="Turn on strict and make all warnings fatal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/strictures'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/strictures-$pkgver.tar.gz")
md5sums=('1a6323eee9f2c9762a77b97e604034d4')

build() {
  local PERL=/usr/bin/perl DIST_DIR="${srcdir}/strictures-$pkgver"

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$DIST_DIR"
    $PERL Makefile.PL
    make
    make test
    make install
  )

  #find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
