# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-struct-dumb'
pkgver='0.03'
pkgrel='1'
pkgdesc="make simple lightweight record-like structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/Struct-Dumb'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Struct-Dumb-0.03.tar.gz')
md5sums=('7b528d9ccd73545c76416d326230dc4e')
sha512sums=('6d66c614f923d933cb4d13555c2cdf21324d5fae52a9ade18fe2dc72a88a0543eead386ab1b5b830703d778d27c5b283ac877466f05a26bd2f8e2c1287aa23fe')
_distdir="Struct-Dumb-0.03"

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
