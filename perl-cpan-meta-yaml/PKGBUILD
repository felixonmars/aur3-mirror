# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-cpan-meta-yaml'
pkgver='0.012'
pkgrel='1'
pkgdesc="Read and write a subset of YAML for CPAN Meta files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-simple')
url='http://search.mcpan.org/dist/CPAN-Meta-YAML'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/CPAN-Meta-YAML-0.012.tar.gz')
md5sums=('bdee91cb71ddc7ed1a30abea611be9bb')
sha512sums=('4b49a68ffcd74e3d32485c0fce7e0e45b88c2ec149c89320ff92df6fd287211c9e48b98145033601831560debbd523afb71bac8400723dd424b3f190a38cba8a')
_distdir="CPAN-Meta-YAML-0.012"

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
  # Test::More version in CORE is 0.98 make test requires 0.99 Skipping Tests
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
