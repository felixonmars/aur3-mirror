# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-log-dispatchouli'
pkgver='2.012'
pkgrel='1'
pkgdesc="a simple wrapper around Log::Dispatch"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-dispatch>=0' 'perl-log-dispatch-array>=0' 'perl-params-util>=0' 'perl-string-flogger>=0' 'perl-sub-exporter>=0' 'perl-sub-exporter-globexporter>=0.002' 'perl-try-tiny>=0.04')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0')
url='http://search.cpan.org/dist/Log-Dispatchouli'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Log-Dispatchouli-2.012.tar.gz')
md5sums=('080d1b18d49b6f55ed2e367bdece7f01')
sha512sums=('b8871a07e8f95c8ba205ee9582d158e3a1e56206f3407db9c2e23a6d7889770603e837f9ad1ac3419da0df90f35605d12872954eab12dc1564c12dd0c375b0ea')
_distdir="Log-Dispatchouli-2.012"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
