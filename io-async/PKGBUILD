# CPAN Name  : IO-Async
# Contributor: luben
# Generator  : CPANPLUS::Dist::Arch 

pkgname='io-async'
pkgver='0.61'
pkgrel='1'
pkgdesc="Asynchronous event-driven programming"
arch=(any)
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future')
makedepends=('perl-test-fatal' 'perl-test-identity' 'perl-test-refcount')
checkdepends=('perl-test-fatal>=0' 'perl-test-identity>=0' 'perl-test-refcount>=0')
url='http://search.cpan.org/dist/IO-Async'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/IO-Async-0.61.tar.gz')
md5sums=('14cbfa50027e0121a95a0f3e259b6d74')
sha512sums=('f3b7c8ed47630ceeb9ca73cce42a6c0ca1bd332e32d7efaa5f71792f68680a339bdc933ceab61b2dbfd109a015ae2d0b928a2fc7e079d50f35cb3aaff8e3a85e')
_distdir="IO-Async-0.61"

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
