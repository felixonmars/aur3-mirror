# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-bdb-wrapper'
pkgver='0.49'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-berkeleydb')
makedepends=()
url='http://search.cpan.org/dist/BDB-Wrapper'
source=('http://search.cpan.org/CPAN/authors/id/H/HI/HIKARINE/BDB-Wrapper-0.49.tar.gz')
md5sums=('61c71501d2a0be88553a315cf789f459')
sha512sums=('a6c0b70aaa77c798d7721b4622c877db9bdefcda5eec951770768068d3fc0b99797b8ff669298399f43395fa1fd398fbd86b23e5449ef26ad681ca89a53991b0')
_distdir="BDB-Wrapper-0.49"

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
