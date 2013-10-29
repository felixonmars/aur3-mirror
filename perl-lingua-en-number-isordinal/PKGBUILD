# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-lingua-en-number-isordinal'
pkgver='0.04'
pkgrel='1'
pkgdesc="detect if English number is ordinal or cardinal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-findnumber>=0' 'perl-try-tiny>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/Lingua-EN-Number-IsOrdinal'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/Lingua-EN-Number-IsOrdinal-0.04.tar.gz')
md5sums=('5b94054b1311ed1bd338356ce1f1741d')
sha512sums=('1d0ecc75b2d474cb41f7692a63ec2f93e4d99d209fec97cf5a1ecd565aeb2fe10dcadd09bcd5a033ad7c4fcc8e710e6eea9481b0977ef5876aa089f92b0eeed2')
_distdir="Lingua-EN-Number-IsOrdinal-0.04"

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
