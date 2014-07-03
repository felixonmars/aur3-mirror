# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-readonly'
pkgver='2.00'
pkgrel='1'
pkgdesc="Facility for creating read-only scalars, arrays, hashes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
url='http://search.mcpan.org/dist/Readonly'
source=('http://search.mcpan.org/CPAN/authors/id/S/SA/SANKO/Readonly-2.00.tar.gz')
md5sums=('05866426331fd2b8d4feebbba245298d')
sha512sums=('293c3be4af0bee2390d5370132c17de31010443123321771dd124d3e285cd72abbdaa7b6f50a2c44102d03a5724636f2976016111efe09afd27149f6880c2bec')
_distdir="Readonly-2.00"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
