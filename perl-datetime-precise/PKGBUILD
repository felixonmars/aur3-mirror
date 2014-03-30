# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-datetime-precise'
pkgver='1.05'
pkgrel='1'
pkgdesc="Perform common time and date operations with"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Precise'
source=('http://search.cpan.org/CPAN/authors/id/B/BZ/BZAJAC/DateTime-Precise-1.05.tar.gz')
md5sums=('05845b6e53a528b406d10a231d0af091')
sha512sums=('5e600412ae9f6c5639b6aa9f5e587996ad36a6229b3e592fb65f3681e2b6bee4510b2705b45477397760daefc2b920ea91dd333d1f36002ad8e4f431efd14161')
_distdir="DateTime-Precise-1.05"

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
