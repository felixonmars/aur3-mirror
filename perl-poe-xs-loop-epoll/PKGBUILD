# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-poe-xs-loop-epoll'
pkgver='1.003'
pkgrel='1'
pkgdesc="XS loop implementation for POE using epoll_*()"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-poe>=1.003')
makedepends=('perl-poe-test-loops>=1.033')
url='http://search.cpan.org/dist/POE-XS-Loop-EPoll'
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TONYC/POE-XS-Loop-EPoll-${pkgver}.tar.gz")
md5sums=('b778bc9e32b80dc6ef8a593bd605aa15')

build() {
  _distdir="${srcdir}/POE-XS-Loop-EPoll-${pkgver}"
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
  _distdir="${srcdir}/POE-XS-Loop-EPoll-${pkgver}"
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  _distdir="${srcdir}/POE-XS-Loop-EPoll-${pkgver}"
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
