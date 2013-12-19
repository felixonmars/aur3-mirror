# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-parse-cpan-meta'
pkgver='1.4409'
pkgrel='1'
pkgdesc="Parse META.yml and META.json CPAN metadata files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Parse-CPAN-Meta'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Parse-CPAN-Meta-1.4409.tar.gz')
md5sums=('33f75f5ef13227655d60c7ed2ca21fae')
sha512sums=('66db554d1725e98e48a4ecf89045a0b88e412844cff849526774ab667c5f81ef697d11e495597e505f3c2803d79ea0ecf3ffc07ed4f55a04ca30fc95fdb27f0e')
_distdir="Parse-CPAN-Meta-1.4409"

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
