# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-prereq'
pkgver='1.038'
pkgrel='1'
pkgdesc="check if Makefile.PL has the right pre-requisites"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-info>=0')
makedepends=()
url='http://search.cpan.org/dist/Test-Prereq'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Test-Prereq-1.038.tar.gz')
md5sums=('349652328aeed7b3f0ebf8734154fd39')
sha512sums=('d117468aeb627b9ee92475958dc7bd418290a8aea7af023542d91defaf7098c86459d4800cd80e385ed6cb3e7279379264b08a2b8037461951167fcd2fa199f3')
_distdir="Test-Prereq-1.038"

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
