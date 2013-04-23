# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-scalar-list-utils'
pkgver='1.27'
pkgrel='1'
pkgdesc="Common Scalar and List utility subroutines"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Scalar-List-Utils'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.27.tar.gz')
md5sums=('d71e318b54d7ff93174f6d67eb74b4aa')
sha512sums=('5881d2b472d0eea55dc560a198b8fba411606caa64bd9b3dfb1def06cced8e2a77570e9c5de918b950052c556870f1d14d1343411e0b18b3cac7aa8af7a4bff4')
_distdir="Scalar-List-Utils-1.27"

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
