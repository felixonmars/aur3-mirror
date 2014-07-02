# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-config-mvp-reader-ini'
pkgver='2.101462'
pkgrel='1'
pkgdesc="an MVP config reader for .ini files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-ini>=0' 'perl-config-mvp>=2' 'perl-moose>=0')
makedepends=()
url='http://search.cpan.org/dist/Config-MVP-Reader-INI'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-MVP-Reader-INI-2.101462.tar.gz')
md5sums=('dcfd0c0dc48dd6f45422bf72847c539f')
sha512sums=('3e1cf59b818c23b33ff4a4d405ca2feb222440eac386a331639f15b5f0e9e7f591b5ee73bfe4774ec1fc7bc29aa5936a914eca33dae50487344e0d4a0daaff73')
_distdir="Config-MVP-Reader-INI-2.101462"

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
