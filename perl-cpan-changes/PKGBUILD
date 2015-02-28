# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-cpan-changes'
pkgver='0.30'
pkgrel='8675309'
pkgdesc="Read and write Changes files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/CPAN-Changes'
source=('http://search.mcpan.org/CPAN/authors/id/B/BR/BRICAS/CPAN-Changes-0.30.tar.gz')
md5sums=('7e4fe1e341f58a760059a34510ba1766')
sha512sums=('d262881ac574328714aa4b10b5e2e3d0c2f282dcd9f98b93df2ddb854b9601a9b2c324e22fbb1a8a491e67ddd334879a88bd6f407421366fa3b2eb3e6af40f4d')
_distdir="CPAN-Changes-0.30"

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
