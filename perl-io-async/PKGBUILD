# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-io-async'
pkgver='0.64'
pkgrel='1'
pkgdesc="Asynchronous event-driven programming"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future>=0.22' 'perl-struct-dumb>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-identity>=0' 'perl-test-refcount>=0')
url='http://search.cpan.org/dist/IO-Async'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/IO-Async-0.64.tar.gz')
md5sums=('52a52cd31d70bbd7d9a2e3dfc18d3853')
sha512sums=('ebd96fcdd045ea974823427a8010384d97c52fd74be183cd17675cd05c0e232f8f66b160d6874365414357cc34a083bbd3a481cffed6d8b4626306825b0ba3ea')
_distdir="IO-Async-0.64"

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
