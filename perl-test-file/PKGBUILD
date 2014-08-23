# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-file'
pkgver='1.36'
pkgrel='1'
pkgdesc="test file attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-manifest>=1.14')
makedepends=()
url='http://search.cpan.org/dist/Test-File'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BAREFOOT/Test-File-1.36.tar.gz')
md5sums=('142b5505bba97c187227e09432d5c92b')
sha512sums=('1a7be21f73991dec7a3c0813765c01f0dfd75338eab4f6faf2976f0dd849fe3260ae44eb6174a22620e93f4471886a6e3fe019cef508163eb07ddce19864396a')
_distdir="Test-File-1.36"

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
