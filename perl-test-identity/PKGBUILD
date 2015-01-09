# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-identity'
pkgver='0.01'
pkgrel='1'
pkgdesc="assert the referential identity of a reference"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Test-Identity'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Test-Identity-0.01.tar.gz')
md5sums=('ecef85c791cf5847e4c374983cf22a74')
sha512sums=('eee20978e2e39a11c5649b4609840f02686482f8fe4c0c2de639bfd9749ba9a08202f70b660432f1142ff800824ee2a6e9e43873f3f089041cd3e864ff502c32')
_distdir="Test-Identity-0.01"

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
